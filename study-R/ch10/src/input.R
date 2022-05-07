## 숫자 입력 sliderInput ###############################################
library(shiny)

ui <- fluidPage(
  sliderInput("integer","Integer:",min=0,max=1000,value=500),
  sliderInput("decimal","Decimal:",min=0,max=1,value=0.5,step=0.1),
  sliderInput("range","Range:",min=1,max=1000,value=c(200,500)),
  sliderInput("format","CustomFormat:",min=0,max=10000,value=0,step=2500,pre="$",sep=",",animate=TRUE),
  sliderInput("interval","기간:",min=as.Date("2017-01-01"),
              max=as.Date("2017-12-31"),
              value=c(as.Date("2017-03-01"),as.Date("2017-05-31")))
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)

## 리스트 선택 입력 selectInput() #######################################
library(shiny)

ui <- fluidPage(
  selectInput("sel1", "다음에서 선택:",choices = c("초급", "중급", "고급")),
  selectInput("sel2", "다음에서 선택:",
              choices = c("초급" = "beginner",
                          "중급" = "intermediate",
                          "고급" = "advanced")),
  textOutput("txt"),
  selectInput("sel3", "다음에서 선택:",
              choices = list("컴파일러 언어" = c("C++", "Java"),
                             "스크립트 언어" = c("R", "JavaScript", "Python")))
  
)

server <- function(input, output, session) {
  output$txt <- renderText({input$sel2})
}

shinyApp(ui, server)

## 리스트 선택 입력 radioButtons() #######################################

library(shiny)

ui <- fluidPage(
  radioButtons("dist", "Distribution type:",
               c("Normal" = "norm",
                 "Uniform" = "unif",
                 "Log-normal" = "lnorm",
                 "Exponential" = "exp")),
  plotOutput("distPlot")
)

server <- function(input, output, session) {
  output $ distPlot <- renderPlot({
    dist <- switch(input $ dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)
    
    hist(dist(500))
  })
}

shinyApp(ui, server)

## 체크박스와 버튼 입력 checkboxGroupInput() #############################

library(shiny)

ui <- fluidPage(
  checkboxGroupInput("sels", "전공 언어(복수 선택 가능)",
                     c("C와 그 방언들", "Java", "JavaScripts", "R", "Perl")),
  verbatimTextOutput("langs")
)

server <- function(input, output, session) {
  output$langs <- renderPrint({
    input$sels
  })
}

shinyApp(ui, server)

## 날짜 입력 dateInput() #################################################

library(shiny)

ui <- fluidPage(
  dateInput("date", "날짜 선택", value = "2017-01-01", language = "ko")
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)

## 날짜 기간 입력 dateRangeInput() ########################################
library(shiny)

ui <- fluidPage(
  dateRangeInput("date", "날짜 선택",
                 start = Sys.Date(),
                 end = Sys.Date() + 30,
                 language = "ko")
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)

## 버튼 actionButton() ####################################################

library(shiny)

ui <- fluidPage(
  sliderInput("obs", "Number of observations", 0, 1000, 500),
  actionButton("goButton", "Go!"),
  plotOutput("distPlot")
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    input$goButton
    dist <- isolate(rnorm(input$obs))
    hist(dist)
  })
}

shinyApp(ui, server)

