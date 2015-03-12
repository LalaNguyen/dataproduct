shinyUI(
  pageWithSidebar(
    headerPanel("Temperature Measurement"),
    sidebarPanel(
      checkboxGroupInput("checkGroup", 
                              label = h4("Choose month(s)"), 
                              choices = list("May" = 5, 
                                             "June" = 6,
                                             "July" = 7,
                                             "August" = 8,
                                             "Septemper" = 9),
                              selected = 5),
      actionButton("goButton","Go!")
   ),
    mainPanel(
      plotOutput("myLine"),
      verbatimTextOutput("omonth")          
  )
))