
ui <- fluidPage(
  
  titlePanel("Pilbara Blend Integrator", "PB Integration"),
  
  tabsetPanel( 
              tabPanel("Results",
                
                       hr(), 
                       
                fluidRow(
                    column(12, 
                       checkboxGroupInput(inputId = "Mines", "Select Mines", 
                         choices =  unlist(distinct(data, Mine), use.names = F), 
                         inline = T, selected = unlist(distinct(data, Mine)))
                          )
                        ),
              
                fluidRow(
                      column(12, 
                        radioButtons(inputId = "Interval", "Select Interval", inline = T, 
                          choiceNames = c("By Period", "By Year"),
                          choiceValues = c("byPeriod", "byYear")
                                    )
                            )
                        ),
  
                
                
                fluidRow(
                column(2,uiOutput("StartPeriodOut")),
                column(2,uiOutput("EndPeriodOut"))
                ),
                
                
                fluidRow(
                  #column(6, tableOutput("tbl")),
                  column(6, tableOutput("plottbl"))
                        ),
  
                  #textOutput("debug"),
  
  
                plotOutput("grades")
                    ),
              
              tabPanel("Data Import",
                       
                       hr(),
                       
                       
                       fluidRow(
                         column(3, offset = 1, selectInput(inputId = "MineSite", "Mine Site",
                                               c("TP", "MDO", "GPBO"), selectize = F, size=3, selected = NULL)),
                         column(3, selectInput(inputId = "PlanVersion", "Plan Version",
                                               c("201707_MTP", "201710_MTP", "201801_MTP", "201804_MTP"), 
                                               selectize = F, size = 3, selected = NULL))
                                ),
                         
                       fluidRow(
                         column(4, offset =1, 
                       fileInput(inputId = "filetoread", label = "Select 'physicals.csv' to import", 
                                   accept = c(
                                     "text/csv",
                                     "text/comma-separated-values,text/plain",
                                     ".csv"), 
                                   buttonLabel = "Browse...", placeholder="No file selected")
                               )                   
                               )
                         
                         
                         
                      )
                       
                       )
              
              
  )

