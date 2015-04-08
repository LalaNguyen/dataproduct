library(UsingR)
require(ggplot2)

data(airquality)

shinyServer(
  function(input, output) {
    observe({
    output$omonth <- renderPrint({
      input$goButton
      isolate(paste(input$checkGroup))
      })
    output$mytable3 <- renderDataTable({
        
        airquality     
     }, options = list(lengthMenu = c(10, 30, 50), pageLength = 10))
    
    
    output$myScatterPlot <- renderPlot({
         dfm <- airquality[,c("Wind","Day","Month")]
         
         input$goButton1
         
         dataInput <- reactive({
                 dfm[dfm$Month %in% input$selectMonth,]
                 })
         isolate(ggplot(dataInput(), aes(Day, Wind), colour = factor(Month))+
                 geom_point()+
                 geom_line(stat = "hline", yintercept = "mean", aes(colour = factor(Month))))
         
                 })
    
    output$omonth2 <- renderPrint({
            input$selectMonth
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