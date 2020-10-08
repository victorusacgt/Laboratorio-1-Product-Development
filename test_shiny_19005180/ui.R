#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(lubridate)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Laboratorio 1 - 19005180"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      sliderInput("slider-input-2",
                  "seleccione un rango",
                  value = c(0,200),
                  min = 0,
                  max = 200,
                  step = 10),
      selectInput('select_input',"seleccione un carro:",
                  choices = rownames(mtcars),
                  selected = "Camaro Z28",
                  multiple = FALSE),
      selectizeInput('select_input_2',"seleccione carros:",
                     choices = rownames(mtcars),
                     selected = "Camaro Z28",
                     multiple = TRUE),
      dateInput('date_input',"Ingrese la fecha:",
                value = today(),
                min = today() - 60, 
                max = today() + 60,
                language = 'es',
                weekstart = 1),
      dateRangeInput("date_range","Ingrese Fecha",
                     start = today()-7,
                     end = today(),
                     separator = 'a'),
      numericInput("num_input", "Observations:", 10, min = 1, max = 100),
      checkboxInput("checkOne", "Seleccione si verdadero",value=FALSE),
      checkboxGroupInput("colores_input", "Seleccione opciones:",
                         choices = c("Azul","Rojo","Amarillo")
      ),
      radioButtons("radio_ex",
                   "Seleccione Genero:",
                   choices = c("M","F")),
      textInput("text_input",
                "ingrese texto:"),
      textAreaInput("text_area",
                    "Ingrese parrafo"),
      actionButton("action_button","ok"),
      actionLink("action_link","siguiente")
      ,submitButton(text = "reprocesar")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Number of bins"),
      verbatimTextOutput("bins_io"),
      h2("seleccione un rango"),
      verbatimTextOutput("rango_io"),
      h2("seleccione carro"),
      verbatimTextOutput("carros_io"),
      h2("seleccione rango de carros"),
      verbatimTextOutput("rango_carros_io"),
      h2("seleccione fecha"),
      verbatimTextOutput("date_io"),
      h2("seleccione rango de fecha"),
      verbatimTextOutput("date_range_io"),
      h2("Numeric Imput"),
      verbatimTextOutput("numeric_io"),
      h2("Seleccione si es verdadero"),
      verbatimTextOutput("checkOne_io"),
      h2("Seleccione colores"),
      verbatimTextOutput("colores_io"),
      h2("Radio Buttons"),
      verbatimTextOutput("radio_io"),
      h2("ingrese texto"),
      verbatimTextOutput("texto_io"),
      h2("Ingrese parrafo"),
      verbatimTextOutput("par_io"),
      h2("Action Button"),
      verbatimTextOutput("action_io"),
      h2("Action Link"),
      verbatimTextOutput("link_io"),
      plotOutput("distPlot")
    )
  )
))