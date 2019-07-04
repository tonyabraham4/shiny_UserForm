
# imports
library(rhandsontable)
library(shiny)
library(tidyverse)
library(dqshiny)
library(DT)


# Loading the table previously saved TODO read csv and store in DF

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

saveData <- function(data) {
  data <- t(data)
  # Create a unique file name
  fileName <- sprintf("%s_%s.csv", as.integer(Sys.time()), digest::digest(data),Sys.getenv("USERNAME"))
  # Write the file to the local system
  write.csv(
    x = data,
    file = file.path(outputDir, fileName), 
    row.names = FALSE, quote = TRUE
  )
}


# Define UI

ui = fluidPage(

  # App title
  titlePanel("Checking out rHandsOnTable", windowTitle = "Tony's App"),
  
  # Datatable to be viewed when app launches 
  
   dq_handsontable_output(id = "table",
                          data = DF),
  

  # rhandsontable(DF, width = 600, height = 300) %>%
    # hot_col("factor_allow", allowInvalid = TRUE),
  actionButton("submit", "Submit"),
  
  
  
  # Output
  mainPanel(
  
        rHandsontableOutput(outputId = "hot")
  
  )
)

# Define Server logic to take input in table and save it, also load the updates(refresh) 

server = function(input, output, session){

  
  
  
    
  #TODO 2 # Whenever a field is filled, aggregate all form data 
  
  dq_render_handsontable("table", DF,
                         table_param = list(rowHeaders = NULL, selectCallback = TRUE))
  
  
  # formData <- reactive({
  # updated_data <- hot_to_r(DF)
    # data <- sapply(DF, function(x) input[[x]])
    # updated_data
  # })  
  
  #TODO 1 # When the Submit button is clicked, save the form data 
  observeEvent(input$submit, {
     DF <- updated_data
    saveData(formData())
  })
  
}

# Create Shiny app object
shinyApp(ui = ui, server = server)
  
 

 
 



