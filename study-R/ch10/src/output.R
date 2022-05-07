## 텍스트 출력 ############################################
library(shiny)

ui <- fluidPage(
  
  h2(textOutput("txt")),
  verbatimTextOutput("sum1")
)

server <- function(input, output) {
  output$txt <- renderText({
    "mtcars를 사용한 회귀 분석"
  })
  output$sum1 <- renderPrint({
    summary(lm(mpg ~ wt + qsec, data = mtcars))
  })
}

shinyApp(ui, server)

## 기본 테이블 출력 ########################################
library(shiny)
library(broom)

ui <- fluidPage(
  h2(textOutput("txt")),
  tableOutput("tab1")
)

server <- function(input,output) {
  output$txt <- renderText({"mtcars를 사용한 회귀 분석"})
  output$tab1 <- renderTable({
    tidy(lm(mpg~wt+qsec, data=mtcars))
  },
  striped=TRUE, hover=TRUE, bordered=TRUE)
}

shinyApp(ui, server)

## 다이내믹한 테이블 출력 ##################################

shinyApp(
  ui = fluidPage(
    fluidRow(column(12,dataTableOutput('table')))
),
  
  server = function(input, output) {
    output $ table <- renderDataTable(iris,
                                      options = list(pageLength = 5,
                                                     initComplete = I("function(settings, json) {alert('Done.');}"))
    )
  }
)

## 플롯 출력 ###############################################
library(shiny)

ui <- fluidPage(
  plotOutput("myPlot")
)

server <- function(input, output, session) {
  output$myPlot <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })
}

shinyApp(ui, server)

## 이미지 출력 #############################################
library(shiny)

ui <- fluidPage(
  fluidRow(
    column(3,
           img(src="Rlogo.png", width="100%")
    ),
    column(9,
           sliderInput("obs", "No. of Random Numbers",
                       min = 30, max = 100, value = 50, width = "100%"),
           plotOutput("myPlot", width = "100%"))
  )
  
)

server <- function(input, output, session) {
  output$myPlot <- renderPlot({
    hist(rnorm(input$obs))
  })
}

shinyApp(ui, server)

