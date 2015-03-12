library(UsingR)
data(airquality)

shinyServer(
  function(input, output) {
    observe({
    output$omonth <- renderPrint({
      input$goButton
      isolate(paste(input$checkGroup))
      })
    output$myLine <- renderPlot({
      input$goButton
      dfm <- airquality[,c("Temp","Day","Month")]
      
      dataInput <- reactive({
        dfm[dfm$Month %in% input$checkGroup,]
        })
      isolate(ggplot(dataInput(), aes(x=Day, y=Temp, group=Month, color=Month)) + geom_line(size = 1))
      })
    })
  }
)