library(tidyverse)
library(shiny)
library(stringr)



data <- tribble(
  ~Period, ~Mine, ~Fe,
  1, "Mine A", 62,
  2, "Mine A", 61.5,
  3, "Mine A", 61.8,
  1, "Mine B", 62.3,
  2, "Mine B", 61.2,
  3, "Mine B", 61.6,
  1, "Mine C", 62.1,
  2, "Mine C", 61.4,
  3, "Mine C", 61.9,
  2017, "Mine A", 62,
  2018, "Mine A", 61.5,
  2019, "Mine A", 61.8,
  2017, "Mine B", 62.3,
  2018, "Mine B", 61.2,
  2019, "Mine B", 61.6,
  2017, "Mine C", 62.1,
  2018, "Mine C", 61.4,
  2019, "Mine C", 61.9)


PeriodBoundaries <- function(interval) {
  PeriodRange = NULL
  iterate_over <-  unique(unlist(data["Period"], use.names = F))
  if(interval == "byPeriod"){
    for(i in iterate_over) {
      if(i<1000){PeriodRange <- c(PeriodRange, i)}
      }
    }
    
   else {
     for(i in iterate_over) {
       if(i>1000){PeriodRange <- c(PeriodRange, i)}
     }
   }
 return(PeriodRange) 
}
