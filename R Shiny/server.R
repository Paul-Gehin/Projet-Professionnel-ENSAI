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

# Fetch data for Histogram
path_dossier_projet <- dirname(dirname(rstudioapi::getSourceEditorContext()$path))
load(paste(path_dossier_projet,"/Data/Histogram.Rdata", sep = ""))

# Fetch data for Line
donnees_line <- jsonlite::fromJSON("https://www.data.gouv.fr/es/datasets/r/0cb7962b-1358-488f-a433-8d452d8d6257")$fields

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
})
