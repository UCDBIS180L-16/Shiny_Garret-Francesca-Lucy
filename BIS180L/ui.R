
library(shiny)

load("shinydata.Rdata")


shinyUI(bootstrapPage(
  
  selectInput("trait","Traits:",
              choices = colnames(shinydata),
              selected = "Region"),
  

  titlePanel("Rice SNP Data"),
  helpText("This application creates a scatter plot using Euclidean distances for a selection of 2500 single-nucleotide polymorphisms (SNPs) for rice. It also colorizes based on a selected characteristic"),
  mainPanel(
  plotOutput(outputId = "mainPlot", height = "300px")
)
  
))
