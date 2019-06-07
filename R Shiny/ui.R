#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Vega-Lite"),

    tabsetPanel(
        tabPanel("Deviation",
                 navlistPanel(
                     tabPanel("Diverging Bar",
                              NULL),
                     tabPanel("Diverging Stacked Bar",
                              NULL),
                     tabPanel("Spine",
                              NULL),
                     tabPanel("Surplus Deficit filled line",
                              NULL)
                 )),
        tabPanel("Correlation",
                 navlistPanel(
                     tabPanel("Scatterplot",
                              NULL),
                     tabPanel("Column + line Timeline",
                              NULL),
                     tabPanel("Connected Scatterplot",
                              NULL),
                     tabPanel("Bubble",
                              NULL),
                     tabPanel("XY heatmap",
                              NULL)
                 )),
        tabPanel("Ranking",
                 navlistPanel(
                     tabPanel("Ordered Bar",
                              NULL),
                     tabPanel("Ordered Column",
                              NULL),
                     tabPanel("Ordered proportionnal symbol",
                              NULL),
                     tabPanel("Dot strip plot",
                              NULL),
                     tabPanel("Slope",
                              NULL),
                     tabPanel("Lollipop",
                              NULL),
                     tabPanel("Bump",
                              NULL)
                 )),
        tabPanel("Distribution",
                 navlistPanel(
                     tabPanel("Histogram",
                              sidebarLayout(
                                  mainPanel(
                                      htmlOutput("Histogram")
                                      ),
                                  sidebarPanel(
                                      sliderInput("nombre_bins",
                                                  label = "Nombre de bins",
                                                  min = 2,
                                                  max = 100,
                                                  value = 20,
                                                  step = 1)
                                  )
                              )),
                     tabPanel("Dot Plot",
                              NULL),
                     tabPanel("Dot Strip Plot",
                              NULL),
                     tabPanel("Barcode Plot",
                              NULL),
                     tabPanel("Boxplot",
                              NULL),
                     tabPanel("Violin Plot",
                              NULL),
                     tabPanel("Population pyramid",
                              NULL),
                     tabPanel("Cumulative Curve",
                              NULL),
                     tabPanel("Frequency Polygons",
                              NULL),
                     tabPanel("Beeswarm",
                              NULL)
                 )),
        tabPanel("Change over time",
                 navlistPanel(
                     tabPanel("Line",
                              NULL),
                     tabPanel("Column",
                              NULL),
                     tabPanel("Column + line timeline",
                              NULL),
                     tabPanel("Slope",
                              NULL),
                     tabPanel("Area chart",
                              NULL),
                     tabPanel("Candlestick",
                              NULL),
                     tabPanel("Fan Chart",
                              NULL),
                     tabPanel("Connected scatterplot",
                              NULL),
                     tabPanel("Calendar heatmap",
                              NULL),
                     tabPanel("Priestley timeline",
                              NULL),
                     tabPanel("Circle timeline",
                              NULL),
                     tabPanel("Vertical timeline",
                              NULL),
                     tabPanel("Seismogram",
                              NULL),
                     tabPanel("Streamgraph",
                              NULL)
                 )),
        tabPanel("Magnitude",
                 navlistPanel(
                     tabPanel("Column",
                              NULL),
                     tabPanel("Bar",
                              NULL),
                     tabPanel("Paired column",
                              NULL),
                     tabPanel("Paired bar",
                              NULL),
                     tabPanel("Marimekko",
                              NULL),
                     tabPanel("Proportional symbol",
                              NULL),
                     tabPanel("Isotype",
                              NULL),
                     tabPanel("Lollipop",
                              NULL),
                     tabPanel("Radar",
                              NULL),
                     tabPanel("Parallel coordinates",
                              NULL),
                     tabPanel("BUllet",
                              NULL),
                     tabPanel("Grouped symbol",
                              NULL)
                 )),
        tabPanel("Part-to-whole",
                 navlistPanel(
                     tabPanel("Stacked column bar",
                              NULL),
                     tabPanel("Marimekko",
                              NULL),
                     tabPanel("Pie",
                              NULL),
                     tabPanel("Donut",
                              NULL),
                     tabPanel("Treemap",
                              NULL),
                     tabPanel("Voronoi",
                              NULL),
                     tabPanel("Arc",
                              NULL),
                     tabPanel("Gridplot",
                              NULL),
                     tabPanel("Venn",
                              NULL),
                     tabPanel("Waterfall",
                              NULL)
                 )),
        tabPanel("Spatial",
                 navlistPanel(
                     tabPanel("Basic Choropeth",
                              NULL),
                     tabPanel("Proportionnal symbol",
                              NULL),
                     tabPanel("Flow map",
                              NULL),
                     tabPanel("Contour Map",
                              NULL),
                     tabPanel("Equalised cartogram",
                              NULL),
                     tabPanel("Scalled cartogram",
                              NULL),
                     tabPanel("Dot density",
                              NULL),
                     tabPanel("Heat map",
                              NULL)
                 )),
        tabPanel("Flow",
                 navlistPanel(
                     tabPanel("Sankey",
                              NULL),
                     tabPanel("Waterfall",
                              NULL),
                     tabPanel("Chord",
                              NULL),
                     tabPanel("Network",
                              NULL)
                 ))
    )
))
