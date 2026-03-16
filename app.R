#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)

ui <- fluidPage(
  
  titlePanel(HTML('<h1>Cars Dataset Analysis</h1>
                  <h3>Author: Carla Domingo Bernardino</h3>
                  <hr>')),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("nrows",
                  "Number of rows:",
                  min = 1,
                  max = 50,
                  value = 10)
    ),
    
    mainPanel(
      plotOutput("carsPlot"),
      br(),
      tableOutput("carsTable")
    )
  )
)

server <- function(input, output) {
  
  output$carsPlot <- renderPlot({
    ggplot(cars[1:input$nrows, ], aes(speed, dist)) +
      geom_point(color = "blue", size = 3) +
      labs(title = "Speed vs Stopping Distance",
           x = "Speed",
           y = "Stopping Distance") +
      theme_minimal()
  })
  
  output$carsTable <- renderTable({
    cars[1:input$nrows, ]
  })
  
}

shinyApp(ui = ui, server = server)
