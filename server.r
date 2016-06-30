library(shiny)
library(data.table)

#setwd("C:/Users/abm/Documents/Coursera-SwiftKey/final/en_US")

source("complete_ngrams.r")
source("predictions.r")

# Server function to predict next word
shinyServer(function(input, output) {
  
  output$next.word <- renderText({
    predict.next.word(input$ngram)
  })
  
})