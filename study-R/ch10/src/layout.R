## navbarpage() ###############################################

library(shiny)
library(shinythemes)
ui <- navbarPage("App Title", theme = shinytheme("united"),
                 tabPanel("Plot"),
                 navbarMenu("More",
                            tabPanel("Summary"),
                            "----",
                            "Section header",
                            tabPanel("Table")
                 )
)

server <- function(input, output, session) {
}

shinyApp(ui, server)

## HTML 태그 사용 ############################################
tags$ul(
  tags$li("a"),
  tags$li("b")
)

x <- list(tags$h1("Title"),
          tags$h2("Header text"),
          tags$p("Text here"))
tagList(x)

## HTML 템플릿 사용 ##########################################
apples <- c(2,3,5,3)
htmlTemplate("shiny_template.html", x=sum(apples))


## 전체 페이지 형태의 HTML 템플릿 ############################
library(shiny)

ui <- htmlTemplate("shiny_complete.html",
                   slider=sliderInput("rand_no","난수의 개수", min=1, max=100, value=50),
                   histo=plotOutput("distPlot")
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$rand_no))
  })
}

shinyApp(ui, server)

## 아이콘 사용 ###############################################

library(shiny)
ui <- navbarPage("아이콘 연습", theme = shinythemes::shinytheme("united"),
                 tabPanel("플롯", icon = icon("bar-chart-o")),
                 tabPanel("정리", icon = icon("list-alt")),
                 tabPanel("표", icon = icon("table"),
                          actionButton("btn", "뷰 업데이트", icon = icon("refresh"))
                 )
)
server <- function(input, output, session) {
  
}

shinyApp(ui, server)

## 테마 지정 ##################################################

library(shiny)
ui <- navbarPage("Darkly",
                 theme = shinythemes::shinytheme("darkly"),
                 tabPanel("Plot", "Plot tab contents..."),
                 navbarMenu("More",
                            tabPanel("Summary", "Summary tab contents..."),
                            tabPanel("Table", "Table tab contents...")
                 )
)
server <- function(input, output, session) {
}

shinyApp(ui, server)

## Flex box ###################################################
library(shiny)
library(ggplot2)
mtcars2 <- mtcars[, c("mpg", "cyl", "wt")]

ui <- fillPage(
  fillRow(
    fillCol(
      plotOutput("plot1",
                 brush = brushOpts(id = "plot1_brush"),
                 height = "100%"),
      plotOutput("plot2", height = "100%")
    ),
    fillCol(
      tableOutput("tbl")
    )
  )
)

server <- function(input, output) {
  
  selectedData <- reactive({
    data <- brushedPoints(mtcars2, input$plot1_brush)
    if (nrow(data) == 0)
      data <- mtcars2
    data
  })
  
  output$plot1 <- renderPlot({
    ggplot(mtcars2, aes(wt, mpg)) + geom_point()
  })
  
  output$plot2 <- renderPlot({
    ggplot(selectedData(), aes(factor(cyl), mpg))  + geom_boxplot()
  })
  
  output$tbl <- renderTable({
    selectedData()
  })
}

shinyApp(ui, server)

## showNotification() ###############################################
shinyApp(
  ui = fluidPage(
    actionButton("show", "Show")
  ),
  server = function(input, output) {
    observeEvent(input$show, {
      showNotification("This is a notification.")
    })
  }
)


## removeNotification() #############################################

shinyApp(
  ui = fluidPage(
    actionButton("show", "Show"),
    actionButton("remove", "Remove")
  ),
  server = function(input, output) {
    # A queue of notification IDs
    ids <- character(0)
    # A counter
    n <- 0
    
    observeEvent(input$show, {
      # Save the ID for removal later
      id <- showNotification(paste("Message", n), duration = NULL)
      ids <<- c(ids, id)
      n <<- n + 1
    })
    
    observeEvent(input$remove, {
      if (length(ids) > 0)
        removeNotification(ids[1])
      ids <<- ids[-1]
    })
  }
)

## 모달 대화상자 ###############################################

shinyApp(
  ui = basicPage(
    actionButton("show", "Show modal dialog")
  ),
  server = function(input, output) {
    observeEvent(input$show, {
      showModal(modalDialog(
        title = "Important message",
        "This is an important message!"
      ))
    })
  }
)


## 진행 안내바 #################################################
library(shiny)
ui <- shinyUI(basicPage(
  plotOutput('plot', width = "300px", height = "300px"),
  actionButton('goPlot', 'Go plot')
))

server <- function(input, output) {
  output$plot <- renderPlot({
    input$goPlot
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    
    withProgress(message = 'Making plot', value = 0, {
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("Doing part", i))
        Sys.sleep(0.1)
      }
    })
    plot(dat$x, dat$y)
  })
}

shinyApp(ui = ui, server = server)

