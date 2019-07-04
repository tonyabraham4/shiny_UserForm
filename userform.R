
library(shiny)
library(ggplot2)
library(tools)

# TODO define load() function to load previously saved data at startup.

ui <- fluidPage(
  sidebarLayout(
    
    # Input
    sidebarPanel(
      
      # Enter text for plot title
      textInput(inputId = "plot_title", 
                label = "Plot title", 
                placeholder = "Enter text to be used as plot title"),
      

      # Select variable for Project quarter
      selectInput(inputId = "lst_qtr", 
                  label = "Select Quarter",
                  choices = c("Q1", "Q2", "Q3", "Q4"), 
                  selected = "Select Quarter"),
      
      # Enter text for Audit Name
      textInput(inputId = "txt_project_name",
                label = "Enter Project Name",
                placeholder = "Enter Project Name to be added"),
      
      # Enter text for Project Manager Name
      textInput(inputId = "txt_project_manager",
                label = "Enter Project Manager Name",
                placeholder = "Enter Project Manager Name to be added"),
      
      # Date input for project Start Date
      dateInput(inputId = "dte_start_date",
                     label = "Select dates",
                     #start = "2013-01-01",
                     #end = "2014-01-01",
                     #min = min_date, max = max_date,
                     startview = "year"),
      
      # Date input for project Delivery Date
      dateInput(inputId = "dte_delivery_date",
                label = "Select Dates",
                #start = "2013-01-01",
                #end = "2014-01-01",
                #min = min_date, max = max_date,
                startview = "year"),
      
      # Action button for plot title
      actionButton(inputId = "btn_submit", 
                   label = "Submit Form"),
      
      # Visual separation
      hr()
  
      
    ),
    
    # Output:
    mainPanel(
      tableOutput(outputId = "datatable")
    )
  )
)


# Server

server <- function(input, output, session) {
  
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)