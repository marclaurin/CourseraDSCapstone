library(shiny)

# UI for next word prediction application
shinyUI(fluidPage(
  
  # Page title
  titlePanel("Data Science Capstone Next Word Prediction Application"),
  helpText("The intent is to predict the next word based on partial text input"),
  
  # Sidebar to input incomplete phrase for next word prediction.
  # Submit Button defers the next word prediction until user
  # clicks the button.
  
  sidebarLayout(
    sidebarPanel(
      
      textInput("ngram", "Please enter a partial phrase in English:", ""),
      
      helpText("Please enter a phrase but omit the last word. Then select the 'Predict Next
                Word' button, below to have the predicted next word returned."),
      
      submitButton("Predict Next Word")
      ),
    
    # Return the predicted next word
    mainPanel(
      h4("The predicted next word is:"),
      verbatimTextOutput("next.word")
      
    )
  )
))