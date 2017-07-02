library(tidyverse)
library(shiny)
library(stringr)

ui <- fluidPage(
  sliderInput(inputId="num", label="Choose a number", value = 25, min =1, max = 200),
  plotOutput("hist"),
  tableOutput("tbl")
  )

data <- tribble(
  ~colA, ~colB,
  "a", 1,
  "b", 2,
  "c", 3)



server <-  function (input, output) {
  output$hist <- renderPlot({
    title <- str_c(input$num," Random normal values", collapse = "")
    hist(rnorm(input$num), main = title)
    })
  output$tbl <- renderTable(data)
}



shinyApp(ui = ui, server = server)

