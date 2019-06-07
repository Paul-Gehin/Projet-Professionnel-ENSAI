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
# Où sont les données ?
URL <- "https://www.insee.fr/fr/statistiques/fichier/1892086/pop-totale-france.xls"
# Titre de l'axe des abscisses
X <- "Âge révolu"
# Titre de l'axe des ordonnées
Y <- "Total de personnes"
# Information auxiliaire sous forme de texte
description <- "Un simple histogramme"
# Précision de l'histogramme
GET(URL, write_disk(tf <- tempfile(fileext = ".html")))
donnees <- readHTMLTable(tf,
                         which = 1,
                         header = TRUE,
                         skip.rows = c(1, 2, 3, 4, 5, 107,108, 109),
                         encoding="UTF-8",
                         stringsAsFactors = FALSE,
                         colClasses = c("character", "integer", "character", "character", "character", "character"))
donnees_finales <- data.frame(Ensemble = as.integer(gsub(" ", "", donnees$Ensemble, fixed = TRUE)), Age_revolu = donnees$`Âge révolu`)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Histogram <- renderUI({
        vl <- alt$
            Chart(donnees_finales)$
            mark_bar()$
            encode(
                alt$X("Age_revolu:Q",
                      bin = alt$Bin(maxbins = input$nombre_bins),
                      axis = alt$Axis(title = X)),
                y = alt$Y('sum(Ensemble):Q',
                          axis = alt$Axis(title = Y))
            )$
            properties(
                title = description
            )

        HTML(vegawidget::vw_to_svg(vl))
        
    })
})
