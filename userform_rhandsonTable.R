
# imports
library(rhandsontable)
library(shiny)
library(tidyverse)


# Loading the table previously saved

DF = data.frame(integer = 1:10,
                numeric = rnorm(10),
                logical = rep(TRUE, 10), 
                character = LETTERS[1:10],
                factor = factor(letters[1:10], levels = letters[10:1], 
                                ordered = TRUE),
                factor_allow = factor(letters[1:10], levels = letters[10:1], 
                                      ordered = TRUE),
                date = seq(from = Sys.Date(), by = "days", length.out = 10),
                stringsAsFactors = FALSE)

loadData <- function() {
  # Read all the files into a list
  files <- list.files("E:/01.r_projects/03.shiny/03.user_input_form/reponses", full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE) 
  # Concatenate all data together into one data.frame
  data <- do.call(rbind, data)
  data
}

# Define UI

ui = fluidPage(

  # App title
  titlePanel("Checking out rHandsOnTable", windowTitle = "Tony's App"),
  
  # Datatable to be viewed when app launches 

  rhandsontable(DF, width = 600, height = 300) %>%
    hot_col("factor_allow", allowInvalid = TRUE),
  actionButton("submit", "Submit"),
  
  
  
  # Output
  mainPanel(
  
        rHandsontableOutput("hot")
  
  )
)

# Define Server logic to take input in table and save it, also load the updates(refresh) 

server = function(input, output, session){

  
  
  
    
  #TODO  # Whenever a field is filled, aggregate all form data 
  formData <- reactive({
    data <- sapply(DT, function(x) input[[x]])
    data
  })  
  
  #TODO # When the Submit button is clicked, save the form data 
  observeEvent(input$submit, {
    saveData(formData())
  })
  
}

# Create Shiny app object
shinyApp(ui = ui, server = server)
  
 

 
 



