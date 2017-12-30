#
# Data is loaded in the EduAttainmentData.R file
# filename <- "http://raw.githubusercontent.com/brooney27519/DevDataProducts_CourseProject/master/Education%20Attainment%20Percentages.csv"
# eduAttain <- read.csv(filename)
#

library(shiny)
source("EduAttainmentData.R")

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Percentage of People with Selected Levels of Education (2006 to 2016)"),
    
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      p("The graph will display the education level that a specific group of people attained from 2006 to 2016."),
      p("The user can choose the sex and race/ethnicity of the group of people to display in the graph."),
      br(),
      
      # Select male, female or both
      selectInput(inputId = "sex", label = strong("Select Sex"),
                  choices = unique(eduAttain$sex),
                  selected = "Both"),
      
      # Select male, female or both
      selectInput(inputId = "race", label = strong("Select Race/Ethnicity"),
                choices = names(eduAttain[4:8]),
                selected = "all_races")
      ),
      
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("eduPlot")
    )
    
  )
))
