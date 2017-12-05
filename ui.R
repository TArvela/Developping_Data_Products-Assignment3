#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  
  
  
  fluidPage(
  
  # Application title
  titlePanel("Compound Interest Calculator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput("initialSum", "Initial Investment", value = 1000000, width = NULL, placeholder = NULL),
       sliderInput("return",
                   "Annual return of Investments (%)",
                   min = -10,
                   max = 20,
                   value = 5),
      sliderInput("returnVar",
                  "Investment returns variation (+/- %)",
                  min = 0,
                  max = 5,
                  value = 1),
       sliderInput("inflation",
                   "Annual inflation (%)",
                   min = -10,
                   max = 10,
                   value = 2),
      sliderInput("inflationVar",
                  "Inflation variation (+/- %)",
                  min = 0,
                  max = 5,
                  value = 0)
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Plot",plotOutput("distPlot")),
        tabPanel("Documentation", verbatimTextOutput("doc"))
      )
       
    )
  )
  
  
))
