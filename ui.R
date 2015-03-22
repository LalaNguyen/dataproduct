require(rCharts)
options(RCHART_LIB = 'polycharts')

shinyUI(
  pageWithSidebar(
    headerPanel("Temperature Measurement"),
    sidebarPanel(
            conditionalPanel(
                    'input.dataset === "Temp"',
                    helpText('Visualizing trending in temperature across different months.'),
                    checkboxGroupInput("checkGroup", 
                                       label = h5("Available month(s)"), 
                                       choices = list("May" = 5, 
                                                      "June" = 6,
                                                      "July" = 7,
                                                      "August" = 8,
                                                      "Septemper" = 9),
                                       selected = 5),
                    actionButton("goButton","Go!")
            ),
            conditionalPanel(
                    'input.dataset === "Wind"',
                    helpText('This chart illustrates Wind Scatter Plot on daily basis.'),
                    selectInput("selectMonth",label = 'Select Month:', 
                                choices=list("May" = 5, 
                                             "June" = 6,
                                             "July" = 7,
                                             "August" = 8,
                                            "Septemper" = 9), multiple=TRUE)
            ),
            conditionalPanel(
                    'input.dataset === "Data Source"',
                    helpText('Display 10 records by default.')
            )
   ),
    mainPanel(
            tabsetPanel(
                    id = 'dataset',
                    tabPanel('Temp',  plotOutput("myLine"),
                             p("You have selected: "),
                             verbatimTextOutput("omonth")          ),
                    tabPanel('Wind', 
                             showOutput("myScatterPlot","polycharts"),
                             p("You have selected: "),
                             verbatimTextOutput("omonth2")   
                             ),
                    tabPanel('Data Source', 
                             dataTableOutput('mytable3'))
            )
            
  )
))