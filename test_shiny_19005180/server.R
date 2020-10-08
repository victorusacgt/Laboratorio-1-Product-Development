#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$bins_io <- renderText({
    input$bins
  })
  
  output$rango_io <- renderText({
    input$`slider-input-2`
  })
  
  output$carros_io <- renderText({
    input$select_input
  })
  
  output$rango_carros_io <- renderText({
    input$select_input_2
  })
  
  output$date_io <- renderPrint({
    input$date_input
  })
  
  output$date_range_io <- renderPrint({
    input$date_range
  })
  
  output$numeric_io <- renderText({
    input$num_input
  })
  
  output$checkOne_io <- renderText({
    input$checkOne
  })
  
  output$colores_io <- renderText({
    input$colores_input
  })
  
  output$radio_io <- renderText({
    input$radio_ex
  })
  
  output$texto_io <- renderText({
    input$text_input
  })
  
  output$par_io <- renderText({
    input$text_area
  })
  
  output$action_io <- renderText({
    input$action_button
  })
  
  output$link_io <- renderText({
    input$action_link
  })
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})