#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$doc <- renderText({ "Compound Interest Calculator
This simple application helps to visualize the possible returns of a sum knowing the return rate, the return rate variation, the inflation and inflation variation.

To use this app the user only has to enter each parameter and visualize the plot.
    " })
  output$distPlot <- renderPlot({
    x<-NULL
    correctedReturn <- ((1+(input$return/100))/(1+(input$inflation/100)))
    x$Years <- 1:20
    test<- as.integer(input$initialSum)
    cat(test+1)
    x$cR <- ((correctedReturn)^(x$Years)*test)
    x$mincR <- ((correctedReturn*(1-(input$returnVar/100))*(1-(input$inflationVar/100)))^(x$Years)*test)
    x$maxcR <- ((correctedReturn*(1+(input$returnVar/100))*(1+(input$inflationVar/100)))^(x$Years)*test)
  
    plot(x= x$Years, y=((x$cR)), type='l',col = 'darkgray',	xlab="Years", ylab="Dollars [$]", main="Compound Interest Graph", ylim=c(min(x$mincR),max(x$maxcR)))
    lines(x$Years, x$mincR, col = 'grey')
    lines(x$Years, x$maxcR, col = 'grey')
    polygon(c(x$Years, rev(x$Years)), c(x$maxcR, rev(x$mincR)),
            col = rgb(0.1,0.5,0.3,0.1), border = NA)
    
  })
  
})
