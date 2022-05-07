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