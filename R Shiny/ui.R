#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
require(vegawidget)

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
                     tabPanel(
                         "Scatterplot",
                         flowLayout(
                            vegawidgetOutput("Scatterplot")
                         )
                     ),
                     tabPanel("Column + line Timeline",
                              NULL),
                     tabPanel("Connected Scatterplot",
                              NULL),
                     tabPanel("Bubble",
                              flowLayout(
                                  vegawidgetOutput("Bubble")
                              )
                     ),
                     tabPanel("XY heatmap",
                              flowLayout(
                                  vegawidgetOutput("Heatmap")
                              ))
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
                                      verticalLayout(
                                          p("La représentation standard d'une distribution statistique."),
                                          p("Pensez à garder un faible écart entre les colonnes pour conserver la \"forme\" de la distribution."),
                                          htmlOutput("Histogram")
                                      )
                                  ),
                                  sidebarPanel(
                                      textInput(inputId = "titre_histogramme",
                                                label = "Titre",
                                                value = "Un simple histogramme"),
                                      sliderInput(inputId = "nombre_bins_histogramme",
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
                              sidebarLayout(
                                  mainPanel(
                                      p("La représentation standard de séries changeant au cours du temps."),
                                      p("Si les données sont irrégulières, vous pouvez considérer d'utiliser des marqueurs pour représenter les points des données."),
                                      htmlOutput("Line")
                                  ),
                                  sidebarPanel(
                                      textInput(inputId = "titre_line",
                                                label = "Titre",
                                                value = "Quantités journalières provisoires injectées de biométhane, agrégées à la maille France, toute unité confondue."),
                                      selectInput("color_line", "Couleur :",
                                                  c("Vert" = "green",
                                                    "Rouge" = "red",
                                                    "Bleue" = "blue"))
                                  )
                              )),
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
