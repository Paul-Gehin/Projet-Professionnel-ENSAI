#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
require(XML) # Permet de parser les fichiers XML
require(httr) # Permet de faire des requetes http
require(altair) # Permet d'utiliser Vega-Lite
require(vegawidget)

Unaccent <- function(text) {
    text <- gsub("['`^~\"]", " ", text)
    text <- iconv(text, to="ASCII//TRANSLIT//IGNORE")
    text <- gsub("['`^~\"]", "", text)
    return(text)
}

# Fetch data for Histogram
path_dossier_projet <- dirname(dirname(rstudioapi::getSourceEditorContext()$path))
load(paste(path_dossier_projet,"/Data/Histogram.Rdata", sep = ""))

# Fetch data for Line
donnees_line <- jsonlite::fromJSON("https://www.data.gouv.fr/es/datasets/r/0cb7962b-1358-488f-a433-8d452d8d6257")$fields

# Fetch data for Scatterplot, Bubbles and HeatMap
load(paste(path_dossier_projet,"/Data/Scatterplot.Rdata", sep = ""))

scatterplot_spec <- 
    alt$Chart(na.omit(donnees_scatterplot))$
    mark_point()$
    encode(
        x = alt$X('DECE1015:Q', axis=alt$Axis(title="Deces entre 2010 et 2015")),
        y = alt$Y('NAIS1015:Q', axis=alt$Axis(title="Naissances entre 2010 et 2015")),
        color = alt$Color('REG:N', legend=alt$Legend(title="Regions")),
        tooltip = c("LIBGEO","DECE1015", "NAIS1015", "REG")
    )$
    properties(
        title = "Scatterplot"
    )#$interactive()

bubble_spec <- 
    alt$Chart(na.omit(donnees_scatterplot))$
    mark_circle()$
    encode(
        x = alt$X('DECE1015:Q', axis=alt$Axis(title="Deces entre 2010 et 2015")),
        y = alt$Y('NAIS1015:Q', axis=alt$Axis(title="Naissances entre 2010 et 2015")),
        color = alt$Color('REG:N', legend=alt$Legend(title="Regions")),
        size = alt$Size('P15_POP:Q', legend=alt$Legend(title="Population en 2015")),
        tooltip = c("LIBGEO","DECE1015", "NAIS1015", "REG")
    )$
    properties(
        title = "Bubbles"
    )#$interactive()

heatmap_spec <- alt$Chart(na.omit(donnees_scatterplot))$mark_rect()$encode(    
    x=alt$X('DECE1015:Q', axis=alt$Axis(title="Deces entre 2010 et 2015")),
    y=alt$Y('NAIS1015:Q', axis=alt$Axis(title="Naissances entre 2010 et 2015")),
    color=alt$Color('P15_POP:Q', legend=alt$Legend(title="Population en 2015")),
    tooltip=c("LIBGEO","DECE1015", "NAIS1015", "REG","P15_POP")
)$
    properties(
        title = "XY Heatmap"
    )#$interactive()

scatterplot <- vegawidget(scatterplot_spec)
bubble <- vegawidget(bubble_spec)
heatmap <- vegawidget(heatmap_spec)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$Histogram <- renderUI({
        vl <- alt$
            Chart(donnees_histogramme)$
            mark_bar()$
            encode(
                alt$X("Age_revolu:Q",
                      bin = alt$Bin(maxbins = input$nombre_bins_histogramme),
                      axis = alt$Axis(title = "Âge révolu")),
                y = alt$Y('sum(Ensemble):Q',
                          axis = alt$Axis(title = "Total de personnes"))
            )$
            properties(
                title = input$titre_histogramme
            )

        HTML(vegawidget::vw_to_svg(vegawidget(vl, embed = vega_embed(renderer = "svg"))))
        
    })
    
    output$Line <- renderUI({
        vl <- alt$Chart(donnees_line)$
            encode(
                x = "journee_gaziere:T",
                y = "quantite_injectee:Q"
            )$
            mark_line(color = input$color_line)$
            properties(
                title = input$titre_line)
        
        HTML(vegawidget::vw_to_svg(vegawidget(vl, embed = vega_embed(renderer = "svg"))))
        
    })
    
    output$Scatterplot <- renderVegawidget(scatterplot)
    
    output$Bubble <- renderVegawidget(bubble)
    
    output$Heatmap <- renderVegawidget(heatmap)
})
