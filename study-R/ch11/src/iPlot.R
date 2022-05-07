## 기본 앱 #######################################
library(shiny)
ui <- fluidPage(
  h2("인터랙티브 플롯의 기본"),
  plotOutput("plot1", click = "clicked_point"),
  h3("클릭한 위치 정보"),
  p(verbatimTextOutput("event_info"))
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    x <- mtcars$wt
    y <- mtcars$mpg
    plot(x, y)
  })
  
  output$event_info <- renderText({
    paste("x:", input$clicked_point$x, "y:", input$clicked_point$y)
  })
}


shinyApp(ui, server)

## brush ##############################################
library(shiny)
ui <- fluidPage(
  h2("인터랙티브 플롯의 기본"),
  plotOutput("plot1", brush = "brushed_area"),
  h3("클릭한 위치 정보"),
  p(verbatimTextOutput("event_info"))
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    x <- mtcars$wt
    y <- mtcars$mpg
    plot(x, y)
  })
  
  output$event_info <- renderText({
    paste("xmin:", input$brushed_area$xmin,
          "ymin:", input$brushed_area$ymin,
          "\nxmax:", input$brushed_area$xmax,
          "ymax:", input$brushed_area$ymax)
  })
}


shinyApp(ui, server)


## nearPoints ########################################

library(shiny)
ui <- fluidPage(
  h2("인터랙티브 플롯의 기본"),
  plotOutput("plot1", click = "clicked_point"),
  h3("클릭한 위치에 근접해 있는 데이터셋"),
  p(verbatimTextOutput("event_info"))
)

server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })
  
  output$event_info <- renderPrint({
    nearPoints(mtcars, input$clicked_point, xvar = "wt", yvar = "mpg")
  })
}


shinyApp(ui, server)


## brushedPoints ####################################

library(shiny)
ui <- fluidPage(
  h2("인터랙티브 플롯의 기본"),
  plotOutput("plot1", brush = "brushed_point"),
  h3("선택 영역 안에 있는 데이터셋"),
  p(verbatimTextOutput("event_info"))
)

server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })
  
  output$event_info <- renderPrint({
    brushedPoints(mtcars, input$brushed_point, xvar = "wt", yvar = "mpg")
  })
}


shinyApp(ui, server)

