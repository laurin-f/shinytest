#install.packages("shiny")
library(shiny)

# Define UI for application that plots random distributions 
ui<-shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Hello Shiny!"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("x1", 
                "first order:", 
                min = -5,
                max = 5, 
                value = 0),
    sliderInput("x2", 
                "second order:", 
                min = -5,
                max = 5, 
                value = 0),
    sliderInput("x3", 
                "third order:", 
                min = -5,
                max = 5, 
                value = 0)
    ,
    sliderInput("x4", 
                "forth order:", 
                min = -5,
                max = 5, 
                value = 0)
    
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("curve")
  )
))

# Define server logic required to generate and plot a random distribution
server<-shinyServer(function(input, output) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$curve <- renderPlot({
    
    # generate an rnorm distribution and plot it
    curve(input$x1*x+input$x2*x^2+input$x3*x^3+input$x4*x^4,from=-2,to=2)


    
  })
})

#this changed
shinyApp(ui = ui, server = server)