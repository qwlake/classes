## 반응성 맥락 ##########################################
library(shiny)

myData <- mtcars

ui <- fluidPage(
  
  numericInput("sel", "mtcars 데이터 행의 개수 입력",
               value = 6, min = 6, max = nrow(myData)),
  tableOutput("carData")
)

server <- function(input, output, session){
  
  output$carData <- renderTable({
    head(myData, input$sel)
  })
  
}

shinyApp(ui, server)

## 비반응성 맥락 시도 ######################################
library(shiny)
myData <- mtcars

ui <- fluidPage(
  numericInput("sel", "mtcars 데이터 행의 개수 입력",
               value = 6, min = 6, max = nrow(mtcars)),
  tableOutput("carData")
  
)

server <- function(input, output, session){
  output$carData <- renderTable({
    head(myData, input$sel)
  })
  
  tryCatch({
    x <- input$sel
  }, error = function(c) cat(c$message))
  
}

shinyApp(ui, server)

## 반응성 표현식 render*() ##################################
library(shiny)

ui <- fluidPage(
  titlePanel("간단한 계산을 위한 앱"),
  wellPanel(
    p("숫자 2 개와 계산법을 선택하세요.")
  ),
  textInput("num1", "첫 번째 숫자"),
  textInput("num2", "두 번째 숫자"),
  radioButtons("cal", "계산법의 선택",
               c("+" = "add", "-" = "sub", "*" = "mul", " / " = "div"),
               inline = TRUE),
  h2("결과"),
  textOutput("result")
)

server <- function(input, output, session){
  output$result <- renderText({
    req(input$num1, input$num2)
    num1 <- as.numeric(input$num1)
    num2 <- as.numeric(input$num2)
    switch(input$cal,
           "add" = {paste(num1, "+", num2, "=", num1 + num2)},
           "sub" = {paste(num1, "-", num2, "=", num1 - num2)},
           "mul" = {paste(num1, "*", num2, "=", num1 * num2)},
           "div" = {paste(num1, "/", num2, "=", round(num1 / num2, 2))}
    )
  })
}

shinyApp(ui, server)


## 반응성 표현식 reactive() ##################################
library(shiny)

ui <- fluidPage(
  titlePanel("간단한 계산을 위한 앱"),
  wellPanel(
    p("숫자 2 개와 계산법을 선택하세요.")
  ),
  textInput("num1", "첫 번째 숫자"),
  textInput("num2", "두 번째 숫자"),
  radioButtons("cal", "계산법의 선택",
               c("+" = "add", "-" = "sub", "*" = "mul", " / " = "div"),
               inline = TRUE),
  h2("결과"),
  textOutput("result")
)

server <- function(input, output, session){
  outputTxt <- reactive({
    req(input$num1, input$num2)
    num1 <- as.numeric(input$num1)
    num2 <- as.numeric(input$num2)
    switch(input$cal,
           "add" = {paste(num1, "+", num2, "=", num1 + num2)},
           "sub" = {paste(num1, "-", num2, "=", num1 - num2)},
           "mul" = {paste(num1, "*", num2, "=", num1 * num2)},
           "div" = {paste(num1, "/", num2, "=", round(num1 / num2, 2))}
    )
  })
  
  output$result <- renderText({
    outputTxt()
  })
}

shinyApp(ui, server)

## 반응성 관찰자 observe() ##################################
library(shiny)

ui <- fluidPage(
  titlePanel("간단한 계산을 위한 앱"),
  wellPanel(
    p("숫자 2 개와 계산법을 선택하세요.")
  ),
  textInput("num1", "첫 번째 숫자"),
  textInput("num2", "두 번째 숫자"),
  radioButtons("cal", "계산법의 선택",
               c("+" = "add", "-" = "sub", "*" = "mul", " / " = "div"),
               inline = TRUE),
  h2("결과"),
  textOutput("result")
)

server <- function(input, output, session){
  outputTxt <- reactive({
    req(input$num1, input$num2)
    num1 <- as.numeric(input$num1)
    num2 <- as.numeric(input$num2)
    switch(input$cal,
           "add" = {paste(num1, "+", num2, "=", num1 + num2)},
           "sub" = {paste(num1, "-", num2, "=", num1 - num2)},
           "mul" = {paste(num1, "*", num2, "=", num1 * num2)},
           "div" = {paste(num1, "/", num2, "=", round(num1 / num2, 2))}
    )
  })
  
  output$result <- renderText({
    outputTxt()
  })
  
  observe({
    cat(outputTxt(), "\n")
  })
}

shinyApp(ui, server)


## 이벤트 기반 ##################################
shinyApp(
  ui = fluidPage(
    column(4,
           numericInput("x", "Value", 5),
           br(),
           actionButton("button", "Show")
    ),
    column(8, tableOutput("table"))
  ),

  server = function(input, output) {
    observeEvent(input$button, {
      cat("Showing", input$x, "rows\n")
    })
    df <- eventReactive(input$button, {
      head(cars, input$x)
    })
    output$table <- renderTable({
      df()
    })
  }
)

## 타이머  1 #####################################
library(shiny)
ui <- fluidPage(
  textOutput("currentTime")
)

server <- function(input, output, session){
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    paste("The current time is", Sys.time())
    
  })
}

shinyApp(ui, server)

## 타이머  2 #####################################

library(shiny)
ui <- fluidPage(
  textOutput("currentTime")
)

server <- function(input, output, session){
  timer <- reactiveTimer(1000, session)
  output$currentTime <- renderText({
    timer()
    paste("The current time is", Sys.time())
    
  })
}

shinyApp(ui, server)