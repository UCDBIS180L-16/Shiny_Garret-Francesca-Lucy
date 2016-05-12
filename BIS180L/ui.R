
library(shiny)

load("shinydata.Rdata")


shinyUI(bootstrapPage(
  

  titlePanel("Rice SNP Data"),
  helpText("This application creates a scatter plot using Euclidean distances for a selection of 2500 single-nucleotide polymorphisms (SNPs) for rice. It also colorizes based on a selected characteristic."),
  mainPanel(
  plotOutput(outputId = "mainPlot", height = "300px"),
  helpText("Each SNP has been clustered into one of four populations. Take note of which characteristics are indicative of which population. Data points that are not colorized according to the provided legend are data where the characteristic is not applicable."),
  selectInput("trait","Traits:",
              choices = c("popID", "Region", "Country_of_Origin", "Seed.color","Pericarp.color"),
              selected = "popID"),
  sidebarPanel( sliderInput("adjust",
              "Size of Data Points:",
              min = 0.5,  max = 10, value = 3))
)
  
))
