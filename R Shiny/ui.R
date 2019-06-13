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

shinyUI(fluidPage(

    # Application title
    titlePanel("Vega-Lite"),
    
    checkboxInput("Display", "Afficher le code"),

    tabsetPanel(
        tabPanel("Deviation",
                 verticalLayout(
                     br(),
                     p("Emphasise variations (+/-) from a fixed reference point. Typically the reference point is zero but it can also be a target or a long-term average. Can also be used to show sentiment (positive/neutral/negative)"),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Diverging Bar",
                                  verticalLayout(
                                      p("A simple standard bar chart that can handle both negative and positive magnitude values")
                                  )),
                         tabPanel("Diverging Stacked Bar",
                                  verticalLayout(
                                      p("Perfect for presenting survey results which involve sentiment (eg disagree, neutral, agree)")
                                  )),
                         tabPanel("Spine",
                                  verticalLayout(
                                      p("Splits a single value into 2 contrasting components (eg Male/Female)")
                                  )),
                         tabPanel("Surplus Deficit filled line",
                                  verticalLayout(
                                      p("The shaded area of these charts allows a balance to be shown; either against a baseline or between two serie")
                                  ))
                     )
                 )),
        tabPanel("Correlation",
                 verticalLayout(
                     br(),
                     p("Show the relationship between two or more variables. Be mindful that, unless you tell them otherwise, many readers will assume the relationships you show them to be causal (i.e. one causes the other)"),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Scatterplot",
                                  verticalLayout(
                                      p("The standard way to show the relationship between two variables, each of which has its own axis"),
                                      vegawidgetOutput("Scatterplot"),
                                      uiOutput("Scatterplot_Rmd")
                                  )),
                         tabPanel("Column + line Timeline",
                                  verticalLayout(
                                      p("A good way of showing the relationship over time between an amount (columns) and a rate (line)"),
                                      vegawidgetOutput("ColumnLineTimeline"),
                                      uiOutput("ColumnLineTimeline_Rmd")
                                  )),
                         tabPanel("Connected Scatterplot",
                                  verticalLayout(
                                      p("Usually used to show how the relationship between 2 variables has changed over time")
                                  )),
                         tabPanel("Bubble",
                                  verticalLayout(
                                      p("Like a scatterplot, but adds additional detail by sizing the circles according to a third variable"),
                                      vegawidgetOutput("Bubble"),
                                      uiOutput("Bubble_Rmd")
                                  )),
                         tabPanel("XY heatmap",
                                  verticalLayout(
                                      p("A good way of showing the patterns between 2 categories of data, less good at showing fine differences in amounts"),
                                      vegawidgetOutput("Heatmap"),
                                      uiOutput("Heatmap_Rmd")
                                  ))
                     )
                 )),
        tabPanel("Ranking",
                 verticalLayout(
                     br(),
                     p("Use where an item's position in an ordered list is more important than its absolute or relative value. Don't be afraid to highlight the points of interest."),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Ordered Bar",
                                  verticalLayout(
                                      p("Standard bar charts display the ranks of values much more easily when sorted into order")
                                  )),
                         tabPanel("Ordered Column",
                                  verticalLayout(
                                      p("Standard bar charts display the ranks of values much more easily when sorted into order")
                                  )),
                         tabPanel("Ordered proportionnal symbol",
                                  verticalLayout(
                                      p("Use when there are big variations between values and/or seeing fine differences between data is not so important.")
                                  )),
                         tabPanel("Dot strip plot",
                                  verticalLayout(
                                      p("Dots placed in order on a strip are a space-efficient method of laying out ranks across multiple categories."),
                                      vegawidgetOutput("DotStripPlot"),
                                      uiOutput("DotStripPlot_Rmd")
                                  )),
                         tabPanel("Slope",
                                  verticalLayout(
                                      p("Perfect for showing how ranks have changed over time or vary between categories."),
                                      vegawidgetOutput("Slope"),
                                      uiOutput("Slope_Rmd")
                                  )),
                         tabPanel("Lollipop",
                                  verticalLayout(
                                      p("Lollipop charts draw more attention to the data value than standard bar/column and can also show rank effectively")
                                  )),
                         tabPanel("Bump",
                                  verticalLayout(
                                      p("Effective for showing changing rankings across multiple dates. For large datasets, consider grouping lines using colour.")
                                  ))
                     )
                 )),
        tabPanel("Distribution",
                 verticalLayout(
                     br(),
                     p("Show values in a dataset and how often they occur. The shape (or skew) of a distribution can be a memorable way of highlighting the lack of uniformity or equality in the data"),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Histogram",
                                  verticalLayout(
                                      p("La représentation standard d'une distribution statistique."),
                                      p("Pensez à garder un faible écart entre les colonnes pour conserver la \"forme\" de la distribution."),
                                      vegawidgetOutput("Histogram"),
                                      uiOutput("Histogram_Rmd")
                                  )),
                         tabPanel("Dot Plot",
                                  verticalLayout(
                                      p("A simple way of showing the range (min/max) of data across multiple categories.")
                                  )),
                         tabPanel("Dot Strip Plot",
                                  verticalLayout(
                                      p("Good for showing individual values in a distribution, can be a problem when too many dots have the same value"),
                                      vegawidgetOutput("DotStripPlot_bis"),
                                      uiOutput("DotStripPlot_bis_Rmd")
                                  )),
                         tabPanel("Barcode Plot",
                                  verticalLayout(
                                      p("Like dot strip plots, good for displaying all the data in a table,they work best when highlighting individual values."),
                                      vegawidgetOutput("Barcode"),
                                      uiOutput("Barcode_Rmd")
                                  )),
                         tabPanel("Boxplot",
                                  verticalLayout(
                                      p("Summarise multiple distributions by showing the median (centre) and range of the data")
                                  )),
                         tabPanel("Violin Plot",
                                  verticalLayout(
                                      p("Similar to a box plot but more effective with complex distributions (data that cannot be summarised with simple average)."),
                                      vegawidgetOutput("ViolinPlot"),
                                      uiOutput("ViolinPlot_Rmd")
                                  )),
                         tabPanel("Population pyramid",
                                  verticalLayout(
                                      p("A standard way for showing the age and sex breakdown of a population distribution; effectively, back to back histograms"),
                                      vegawidgetOutput("Pyramid"),
                                      uiOutput("Pyramid_Rmd")
                                  )),
                         tabPanel("Cumulative Curve",
                                  verticalLayout(
                                      p("A good way of showing how unequal a distribution is: y axis is always cumulative frequency, x axis is always a measure.")
                                  )),
                         tabPanel("Frequency Polygons",
                                  verticalLayout(
                                      p("For displaying multiple distributions of data. Like a regular line chart, best limited to a maximum of 3 or 4 datasets")
                                  )),
                         tabPanel("Beeswarm",
                                  verticalLayout(
                                      p("Use to emphasise individual points in a distribution. Points can be sized to an additionnal variable. Best with medium-sized datasets.")
                                  ))
                     )
                 )),
        tabPanel("Change over time",
                 verticalLayout(
                     br(),
                     p("Give emphasis to changing trends. These can be short (intra-day) movements or extended series traversing decades or centuries: Choosing the correct time period is important to provide suitable context for the reader."),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Line",
                                  verticalLayout(
                                      p("La représentation standard de séries changeant au cours du temps."),
                                      p("Si les données sont irrégulières, vous pouvez considérer d'utiliser des marqueurs pour représenter les points des données."),
                                      vegawidgetOutput("Line"),
                                      uiOutput("Line_Rmd")
                                  )),
                         tabPanel("Column",
                                  verticalLayout(
                                      p("Columns work well for showing change over time - but usually best with only one series of data at a time")
                                  )),
                         tabPanel("Column + line timeline",
                                  verticalLayout(
                                      p("A good way of showing the relationship over time between an amount (columns) and a rate (line)")
                                  )),
                         tabPanel("Slope",
                                  verticalLayout(
                                      p("Good for showing changing data as long as the data can be simplified into 2 or 3 points without missing a key part of story")
                                  )),
                         tabPanel("Area chart",
                                  verticalLayout(
                                      p("Use with care. These are good at showing changes to total, but seeing change in components can be very difficult."),
                                      vegawidgetOutput("AreaChart"),
                                      uiOutput("AreaChart_Rmd")
                                  )),
                         tabPanel("Candlestick",
                                  verticalLayout(
                                      p("Usually focused on day-to-day activity, these charts show opening/closing and hi/low points of each day"),
                                      vegawidgetOutput("Candlestick"),
                                      uiOutput("Candlestick_Rmd")
                                  )),
                         tabPanel("Fan Chart",
                                  verticalLayout(
                                      p("Use to show the uncertainty in future projections - usually this grows the further forward to projection")
                                  )),
                         tabPanel("Connected scatterplot",
                                  verticalLayout(
                                      p("A good way of showing changing data for two variables whenever there is a relatively clear pattern of progression."),
                                      vegawidgetOutput("ConnectedScatterplot"),
                                      uiOutput("ConnectedScatterplot_Rmd")
                                  )),
                         tabPanel("Calendar heatmap",
                                  verticalLayout(
                                      p("A great way of showing temporal patterns (daily, weekly, monthly), at the expense of showing precision in quantity")
                                  )),
                         tabPanel("Priestley timeline",
                                  verticalLayout(
                                      p("Great when date and duration are key elements of the story in the data")
                                  )),
                         tabPanel("Circle timeline",
                                  verticalLayout(
                                      p("Good for showing discrete values of varying size across multiple categories (eg earthquakes by contintent)"),
                                      vegawidgetOutput("CircleTimeline"),
                                      uiOutput("CircleTimeline_Rmd")
                                  )),
                         tabPanel("Vertical timeline",
                                  verticalLayout(
                                      p("Presents time on the Y axis. Good for displaying detailed time series that work especially well when scrolling on mobile")
                                  )),
                         tabPanel("Seismogram",
                                  verticalLayout(
                                      p("Another alternative to the circle timeline for showing series where there are big variations in the data")
                                  )),
                         tabPanel("Streamgraph",
                                  verticalLayout(
                                      p("A type of area chart; use when seeing changes in proportions over time is more important than individual values"),
                                      vegawidgetOutput("Streamgraph"),
                                      uiOutput("Streamgraph_Rmd")
                                  ))
                     )
                 )),
        tabPanel("Magnitude",
                 verticalLayout(
                     br(),
                     p("Show size comparisons. These can be relative (just being able to see larger/bigger) or absolute (need to see fine differences). Usually these show a 'counted' number (for example, barrels, dollars or people) rather than a calculated rate or per cent."),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Column",
                                  verticalLayout(
                                      p("The standard way to compare the size of things. Must always start at 0 on the axis")
                                  )),
                         tabPanel("Bar",
                                  verticalLayout(
                                      p("See before. Good when the data are not time series and labels have long category names.")
                                  )),
                         tabPanel("Paired column",
                                  verticalLayout(
                                      p("As per standard column but allows for multiple series. Can become tricky to read with more than 2 series"),
                                      vegawidgetOutput("PairedColumn"),
                                      uiOutput("PairedColumn_Rmd")
                                  )),
                         tabPanel("Paired bar",
                                  verticalLayout(
                                      p("As per standard bar but allows for multiple series. Can become tricky to read with more than 2 series"),
                                      vegawidgetOutput("PairedBar"),
                                      uiOutput("PairedBar_Rmd")
                                  )),
                         tabPanel("Marimekko",
                                  verticalLayout(
                                      p("A good way of showing the size and proportion of data at the same time - as long as the data are not too complicated"),
                                      vegawidgetOutput("Marimekko_bis"),
                                      uiOutput("Marimekko_bis_Rmd")
                                  )),
                         tabPanel("Proportional symbol",
                                  verticalLayout(
                                      p("Use when there are big variations between values and/or seeing fine diferences between data is not so important")
                                  )),
                         tabPanel("Isotype",
                                  verticalLayout(
                                      p("Excellent solution in some instances - use only with whole numbers (do not slice off an arm to represent a decimal)."),
                                      vegawidgetOutput("Isotype"),
                                      uiOutput("Isotype_Rmd")
                                  )),
                         tabPanel("Lollipop",
                                  verticalLayout(
                                      p("Lollipop charts draw more attention to the data value than standard bar/column and can also show rank effectively")
                                  )),
                         tabPanel("Radar",
                                  verticalLayout(
                                      p("A space-efficient way of showing value pf multiple variables - but make sure they are organised in a way that makes sense to reader.")
                                  )),
                         tabPanel("Parallel coordinates",
                                  verticalLayout(
                                      p("An alternative to radar charts - again, the arrngement of the variables is important. Usually benefits from highlighting values")
                                  )),
                         tabPanel("Bullet",
                                  verticalLayout(
                                      p("Good for showing a measurement against the context of a target or performance range")
                                  )),
                         tabPanel("Grouped symbol",
                                  verticalLayout(
                                      p("An alternative to bar/column charts when being able to count data or highlight individual elements is useful.")
                                  ))
                     )
                 )),
        tabPanel("Part-to-whole",
                 verticalLayout(
                     br(),
                     p("Show how a single entity can be broken down into its component elements. If the reader's interest is solely in the size of the components, consider a magnitude-type chart instead"),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Stacked column bar",
                                  verticalLayout(
                                      p("A simple way of showing part-to-whole relationships but can be difficult to read with more than a few components"),
                                      vegawidgetOutput("StackedColumnBar"),
                                      uiOutput("StackedColumnBar_Rmd")
                                  )),
                         tabPanel("Marimekko",
                                  verticalLayout(
                                      p("A good way of showing the size and proportion of data at the same time as long as the data are not too complicated."),
                                      vegawidgetOutput("Marimekko"),
                                      uiOutput("Marimekko_Rmd")
                                  )),
                         tabPanel("Pie",
                                  verticalLayout(
                                      p("A common way of showing part-to-whole data - but be aware that it's difficult to accurately compare the size of the segments.")
                                  )),
                         tabPanel("Donut",
                                  verticalLayout(
                                      p("Similar to a pie chart - but the centre can be a good way of making space to include more information about the data (eg. total)")
                                  )),
                         tabPanel("Treemap",
                                  verticalLayout(
                                      p("Use for hierarchical part-to-whole relationships; can be difficult to read when there are many small segments")
                                  )),
                         tabPanel("Voronoi",
                                  verticalLayout(
                                      p("A way of turning points into areas - any point within the area is closer to the central point than any other point")
                                  )),
                         tabPanel("Arc",
                                  verticalLayout(
                                      p("A hemicycle, often used for visualising political results.")
                                  )),
                         tabPanel("Gridplot",
                                  verticalLayout(
                                      p("Good for showing % information, they work best when used on whole numbers and work well in multiple layout form.")
                                  )),
                         tabPanel("Venn",
                                  verticalLayout(
                                      p("Generally only used for schematic representation")
                                  )),
                         tabPanel("Waterfall",
                                  verticalLayout(
                                      p("Can be useful for showing part-to-whole relationships where some of the components are negative.")
                                  ))
                     )
                 )),
        tabPanel("Spatial",
                 verticalLayout(
                     br(),
                     p("Used only when precise locations or geographical patterns in data are more important to the reader than anything else."),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Basic Choropeth",
                                  verticalLayout(
                                      p("The standard approach for putting data on a map - should always be rates rather than totals and use a sensible base geography.")
                                  )),
                         tabPanel("Proportionnal symbol",
                                  verticalLayout(
                                      p("Use for totals rather than rates - be wary that small differences in data will be hard to see.")
                                  )),
                         tabPanel("Flow map",
                                  verticalLayout(
                                      p("For showing unambiguous movement across a map")
                                  )),
                         tabPanel("Contour Map",
                                  verticalLayout(
                                      p("For showing areas of equal value on a map. Can use deviation colour schemes for showing +/- values")
                                  )),
                         tabPanel("Equalised cartogram",
                                  verticalLayout(
                                      p("Converting each unit on a map to a regular and equally-sized shape - good for representing voting regions with equal share.")
                                  )),
                         tabPanel("Scalled cartogram",
                                  verticalLayout(
                                      p("Stretching and shrinking a map so that each area is sized according to a particular value.")
                                  )),
                         tabPanel("Dot density",
                                  verticalLayout(
                                      p("Used to show the location of individual events/locations - make sure to annotate any patterns the reader should see.")
                                  )),
                         tabPanel("Heat map",
                                  verticalLayout(
                                      p("Grid-based data values mapped with an intensity colour scale. As choropleth map - but not snapped to an admin/political unit.")
                                  ))
                     )
                 )),
        tabPanel("Flow",
                 verticalLayout(
                     br(),
                     p("Show the reader volumes or intensity of movement between two or more states or conditions. These might be logical sequences or geographical locations"),
                     br(),
                     br(),
                     navlistPanel(
                         tabPanel("Sankey",
                                  verticalLayout(
                                      p("Shows changes in flows from one condition to at least one other; good for tracing the eventual outcome of a complex process.")
                                  )),
                         tabPanel("Waterfall",
                                  verticalLayout(
                                      p("Designed to show the sequencing of data through a flow process, typically budgets. Can include +/- components")
                                  )),
                         tabPanel("Chord",
                                  verticalLayout(
                                      p("A complex but powerful diagram which can illustrate 2-way flows (and net winner) in a matrix")
                                  )),
                         tabPanel("Network",
                                  verticalLayout(
                                      p("Used for showing the complexity and inter-connectdness of relationships of varying types.")
                                  ))
                     )
                 )
            ))
))
