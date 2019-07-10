
library(shiny)
library(ggplot2)
library(tools)
library(readxl)

# TODO define load() function to load previously saved data at startup.

projects <- read_excel("E:/01.r_projects/03.shiny/03.user_input_form/project_tracker.xlsx")

ui <- fluidPage(
  sidebarLayout(
    
    # Input
    sidebarPanel(
      
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
                #min = min_datfe, max = max_date,
                startview = "year"),
      
      # Action button for plot title
      actionButton(inputId = "btn_submit", 
                   label = "Submit Form"),
      
      # Visual separation
      hr()
  
      
    ),
    
    # Output:
    mainPanel(
      DT::dataTableOutput(outputId = "data_table")
    )
  )
)


# Server
# TODO
server <- function(input, output, session) {
  
  df <- eventReactive(input$btn_submit, {
    # projects <- projects
    
    projects_updated <- data.frame(Quarter = input$lst_qtr,
                                   `Project Name` = input$txt_project_name,
                                   `Project Manager Name` = input$txt_project_manager,
                                   `Start Date` = input$dte_start_date,
                                   `End Date` = input$dte_end_date)
    
   
    
    output$data_table <- DT::renderDataTable({
      DT::datatable(data =projects(), 
                    options = list(pageLength = 10), 
                    rownames = FALSE)
    })
    
    projects <- rbind(projects, projects_updated)
   
  })

  

  
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)