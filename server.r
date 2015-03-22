library(UsingR)
require(rCharts)
options(RCHART_WIDTH = 800)

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
    
    output$myScatterPlot <- renderChart2({
         subset <- airquality[airquality$Month==input$selectMonth,]
         p1 <- rPlot(Wind~Day, data=subset, color="Month",type="point",size = list(const = 3))
         p1$addParams(width = 600, height = 400, dom = 'chart1',
                     title = " Wind Scatter Plot on regular daily basis")
         p1$guides(x = list(title = "", min = 0,max = 32 ))
         p1$guides(y = list(title = "", max = 22))
         return(p1)
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