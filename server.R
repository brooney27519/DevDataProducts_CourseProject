#
# Users select inputId = "sex" and inputId = "race" to create the plot
#

library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$eduPlot <- renderPlot({
 
    plotData <- eduAttain %>% select(year, education_level, sex, input$race) %>% filter(sex == input$sex)
    
    sub_title <- paste0("Sex = ", input$sex ,"; Race = ", input$race)
    
    eduPlot <- ggplot(data = plotData, aes(x=year, y=plotData[,4])) +
      geom_line(aes(colour=education_level)) + 
      labs(title = "Percent of People Attaining Education Level",
                  subtitle = sub_title,
                  x = "year", y = "Percent of People, (age 25 - 29)") +
      theme(plot.title = element_text(size=14)) +
      theme(plot.subtitle=element_text(size=12)) +
      scale_colour_discrete(name="Educational Level Attained") +
      theme(legend.position="bottom", legend.direction = "vertical") +
      theme(legend.title = element_text(size=11)) +
      theme(legend.text = element_text(size=10))
    
    
    eduPlot
  })
  
})
