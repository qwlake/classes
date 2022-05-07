## conditionalPanel() #############################################

library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("diamonds 데이터"),
  sidebarPanel(
    selectInput("plotType", "Plot Type",
                c(Scatter = "scatter", Histogram = "hist")
    ),
    # Only show this panel if the plot type is a histogram
    conditionalPanel(
      condition = "input.plotType == 'hist'",
      selectInput(
        "breaks", "Breaks",
        c("Sturges", "Scott", "Freedman-Diaconis", "[Custom]" = "custom")
      ),
      # Only show this panel if Custom is selected
      conditionalPanel(
        condition = "input.breaks == 'custom'",
        sliderInput("breakCount", "Break Count", min = 1, max = 50, value = 10)
      )
    )
  ),
  mainPanel(
    plotOutput("plot")
  )
)

server <- function(input, output) {
  brs <- reactive({
    
    if (input$breaks == "custom") {
      input$breakCount
    } else {
      input$breaks
    }
  })
  
  p <- reactive({
    if (input$plotType == "scatter") {
      plot(diamonds$carat, diamonds$price, col= "red")
    } else {
      hist(diamonds$carat, breaks = brs())
    }
  })
  
  output$plot <- renderPlot({
    p()
  })
}

shinyApp(ui, server)

## renderUI와 uiOutput 함수 #############################################

library(shiny)

ui <- fluidPage(
  titlePanel("표나 플롯 중에서 선택하는 앱"),
  radioButtons("selected",
               label = "표시할 내용 선택",
               choices = list("table", "plot")),
  uiOutput("tbl2"),
  uiOutput("plot2")
)

server <- function(input, output, session){
  output$tbl <- renderTable({
    mtcars
  })
  
  output$tbl2 <- renderUI({
    if (input$selected == "table") {
      tableOutput("tbl")
    }
  })
  
  output$plt <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })
  
  output$plot2 <- renderUI({
    if (input$selected == "plot") {
      plotOutput("plt")
    }
  })
}

shinyApp(ui, server)

## insertUI #########################################################

library(shiny)

ui <- fluidPage(
  actionButton("add", "Add UI")
)

server <- function(input, output, session) {
  observeEvent(input$add, {
    insertUI(
      selector = "#add",
      where = "afterEnd",
      ui = textInput(paste0("txt", input$add),
                     "Insert some text")
    )
  })
}

shinyApp(ui, server)

## removeUI #########################################################

library(shiny)

ui <- fluidPage(
  actionButton("rmv", "Remove UI"),
  textInput("txt", "This is no longer useful")
)

server <- function(input, output, session) {
  observeEvent(input$rmv, {
    removeUI(
      selector = "div:has(> #txt)"
    )
  })
}

shinyApp(ui, server)

## insertUI의 활용 ##############################################

library(shiny)
library(stringr)

ui <- fluidPage(
  actionButton("add", "Add UI"),
  verbatimTextOutput("allText")
)

server <- function(input, output, session) {
  observeEvent(input$add, {
    insertUI(
      selector = "#add",
      where = "afterEnd",
      ui = textInput(paste0("txt", input$add),
                     "Insert some text",
                     placeholder = "문자를 입력하세요.")
    )
  })
  
  output$allText <- renderPrint({
    req(input$add)
    txts <- unlist(lapply(seq(1, input$add), function(x) paste0("txt", x)))
    paste(unlist(lapply(txts, function(x) str_trim(input[[x]]))), collapse = " ")
  })
}

shinyApp(ui, server)


