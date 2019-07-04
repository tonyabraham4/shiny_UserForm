
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
      
      # Action button for plot title
      actionButton(inputId = "submit_button", 
                   label = "Submit Form"),
      
      # Visual separation
      hr(),
      
      # Select variable for y-axis
      selectInput(inputId = "list_qtr", 
                  label = "Select Quarter:",
                  choices = c("Q1", "Q2", "Q3", "Q4"), 
                  selected = "Select Quarter"),
      
      # Enter text for Audit Name
      textInput(inputId = "txt_project_name",
                label = "Enter Project Name",
                placeholder = "Enter Project Name to be added"),
      
      
      
      # Select variable for x-axis
      selectInput(inputId = "list_audit_name", 
                  label = "Audit Name",
                  choices = c("IMDB rating" = "imdb_rating", 
                              "IMDB number of votes" = "imdb_num_votes", 
                              "Critics Score" = "critics_score", 
                              "Audience Score" = "audience_score", 
                              "Runtime" = "runtime"), 
                  selected = "critics_score"),
      
      # Select variable for color
      selectInput(inputId = "z", 
                  label = "Color by:",
                  choices = c("Title Type" = "title_type", 
                              "Genre" = "genre", 
                              "MPAA Rating" = "mpaa_rating", 
                              "Critics Rating" = "critics_rating", 
                              "Audience Rating" = "audience_rating"),
                  selected = "mpaa_rating"),
      
      # Set alpha level
      sliderInput(inputId = "alpha", 
                  label = "Alpha:", 
                  min = 0, max = 1, 
                  value = 0.5),
      
      # Set point size
      sliderInput(inputId = "size", 
                  label = "Size:", 
                  min = 0, max = 5, 
                  value = 2)
      
    ),
    
    # Output:
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)


# Server

server <- function(input, output, session) {
  
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)