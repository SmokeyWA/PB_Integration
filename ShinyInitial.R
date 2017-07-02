library(shiny)
library(stringr)

ui <- fluidPage(
  sliderInput(inputId="num", label="Choose a number", value = 25, min =1, max = 200),
  plotOutput("hist")
  
  
  )



server <-  function (input, output) {
  output$hist <- renderPlot({
    title <- str_c(input$num," Random normal values", collapse = "")
    hist(rnorm(input$num), main = title)
    })
}



shinyApp(ui = ui, server = server)

