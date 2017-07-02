



server <-  function (input, output) {
  
  #output$debug <- renderPrint(input$Mines)
  
  
  #start observer so we can access reactive elements in the code
  observe({
  
  output$StartPeriodOut <- renderUI({
    selectInput(inputId = "StartPeriod", "First Period",
                choices = c( min(PeriodBoundaries(input$Interval)) : max(PeriodBoundaries(input$Interval)) ), 
                  selectize = F, size = 3, selected = min(PeriodBoundaries(input$Interval)))})
  
  output$EndPeriodOut <- renderUI({
    selectInput(inputId = "EndPeriod", "Last Period",
                choices = c( min(PeriodBoundaries(input$Interval)) : max(PeriodBoundaries(input$Interval)) ), 
                selectize = F, size = 3, selected = max(PeriodBoundaries(input$Interval)))})
  
  
  output$tbl <- renderTable(data)
  
  #on first run dynamically generated UI elemnts are null, need to trap error
  if(!is.null(input$StartPeriod)){
  
    output$grades <- renderPlot({

    
    
    #put code here to filter data prior to plotting
    plotdata <- data %>%
      filter(Period >= as.integer(input$StartPeriod)) %>%
      filter(Period <= as.integer(input$EndPeriod)) %>%
      filter(Mine %in% input$Mines)

    
    output$plottbl <- renderTable(plotdata, digits = 0)

    ggplot(plotdata) +
      geom_line(aes(Period, Fe, colour = Mine)) +
      geom_point(aes(Period, Fe, colour = Mine))
    
  })}


})} #close observer and server function



