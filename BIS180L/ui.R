#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)



shinyUI(bootstrapPage(
  
  selectInput(inputId = "trait",
              label = "Traits",
              choices = c(popID, Particle.number.per.plant, Region, Alu.Tol, Plant.height, Seed.number.per.particle, Seed.color, Pericarp.color, Amylose.content, Protein.content),
              selected = popID),
  

  
  plotOutput(outputId = "mainPlot", height = "300px"),
  
  # Display this only if the density is shown
  conditionalPanel(condition = "input.density == true",
                   sliderInput(inputId = "bw_adjust",
                               label = "Bandwidth adjustment:",
                               min = 0.2, max = 2, value = 1, step = 0.2)
  )
  
))
