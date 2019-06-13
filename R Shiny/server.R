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


# Fetch graphs
path_dossier_projet <- dirname(dirname(rstudioapi::getSourceEditorContext()$path))
files <- list.files(paste(path_dossier_projet,"/Graphs", sep = ""))
for (i in 1:length(files)) {
    load(paste(path_dossier_projet, "/Graphs/", files[i], sep = ""))
}



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$Histogram <- renderVegawidget(vegawidget(histogram))
    output$Line <- renderVegawidget(vegawidget(line_graph))
    output$Scatterplot <- renderVegawidget(vegawidget(scatterplot))
    output$Bubble <- renderVegawidget(vegawidget(bubbles))
    output$Heatmap <- renderVegawidget(vegawidget(XYheatmap))
    output$ViolinPlot <- renderVegawidget(vegawidget(violinPlot))
    output$CircleTimeline <- renderVegawidget(vegawidget(circleTimeline))
    output$PairedColumn <- renderVegawidget(vegawidget(pairedColumn))
    output$PairedBar <- renderVegawidget(vegawidget(pairedBar))
    output$Pyramid <- renderVegawidget(vegawidget(pyramid))
    output$Streamgraph <- renderVegawidget(vegawidget(streamgraph))
    output$Marimekko <- renderVegawidget(vegawidget(marimekko))
    output$Marimekko_bis <- renderVegawidget(vegawidget(marimekko))
    output$StackedColumnBar <- renderVegawidget(vegawidget(stackedColumnBar))
    output$DotStripPlot <- renderVegawidget(vegawidget(dotStripPlot))
    output$DotStripPlot_bis <- renderVegawidget(vegawidget(dotStripPlot))
    output$Barcode <- renderVegawidget(vegawidget(barcode))
    output$ConnectedScatterplot <- renderVegawidget(vegawidget(connectedScatterplot))
    output$AreaChart <- renderVegawidget(vegawidget(areaChart))
    output$Slope <- renderVegawidget(vegawidget(slope))
    output$Candlestick <- renderVegawidget(vegawidget(candlestick))
    output$Isotype <- renderVegawidget(vegawidget(isotype))
    output$ColumnLineTimeline <- renderVegawidget(vegawidget(columnLineTimeline))
    
    output$Histogram_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/4-Distribution/1-Histogram.Rmd", sep = ""))
        }
    })
    output$Line_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/5-Change over time/1-Line.Rmd", sep = ""))
        }
    })
    output$Scatterplot_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/2-Correlation/1-Scatterplot.Rmd", sep = ""))
        }
    })
    output$Bubble_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/2-Correlation/4-Bubble.Rmd", sep = ""))
        }
    })
    output$Heatmap_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/2-Correlation/5-XY heatmap.Rmd", sep = ""))
        }
    })
    output$ViolinPlot_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/4-Distribution/6-Violin Plot.Rmd", sep = ""))
        }
    })
    output$CircleTimeline_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/5-Change over time/11-Circle timeline.Rmd", sep = ""))
        }
    })
    output$PairedColumn_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/6-Magnitude/3-Paired column.Rmd", sep = ""))
        }
    })
    output$PairedBar_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/6-Magnitude/4-Paired bar.Rmd", sep = ""))
        }
    }) 
    output$Pyramid_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/4-Distribution/7-Population pyramid.Rmd", sep = ""))
        }
    })
    output$Streamgraph_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/5-Change over time/14-Streamgraph.Rmd", sep = ""))
        }
    })
    output$Marimekko_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/7-Part-to-whole/2-Marimekko.Rmd", sep = ""))
        }
    })
    output$Marimekko_bis_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/7-Part-to-whole/2-Marimekko.Rmd", sep = ""))
        }
    })
    output$StackedColumnBar_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/7-Part-to-whole/1-Stacked column bar.Rmd", sep = ""))
        }
    })
    output$DotStripPlot_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/4-Distribution/3-Dot strip plot.Rmd", sep = ""))
        }
    })
    output$DotStripPlot_bis_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/4-Distribution/3-Dot strip plot.Rmd", sep = ""))
        }
    })
    output$Barcode_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/4-Distribution/4-Barcode plot.Rmd", sep = ""))
        }
    })
    output$ConnectedScatterplot_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/5-Change over time/8-Connected scatterplot.Rmd", sep = ""))
        }
    })
    output$AreaChart_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/5-Change over time/5-Area chart.Rmd", sep = ""))
        }
    })
    output$Slope_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/5-Change over time/4-Slope.Rmd", sep = ""))
        }
    })
    output$Candlestick_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/5-Change over time/6-Candlestick.Rmd", sep = ""))
        }
    })
    output$Isotype_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/6-Magnitude/7-Isotype.Rmd", sep = ""))
        }
    })
    output$ColumnLineTimeline_Rmd <- renderUI({
        if (input$Display) {
            includeMarkdown(path = paste(path_dossier_projet, "/Notebooks/2-Correlation/2-Column + line Timeline.Rmd", sep = ""))
        }
    })
    
})
