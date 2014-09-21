library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Effect of Sample Size on Sample mean and Sample standard deviation"),
  sidebarPanel(
    p(em("Documentation:",a("StatsEducator",href="index.html"))),
    numericInput('lamda', 'Lamda of Poisson Distribution', 2, min = 0, max = 50, step = 1),
    numericInput('numsim', 'Number of simulations', 1000, min = 0, max = 3000, step = 10),
    numericInput('n1', 'Sample Size 1', 10, min = 3, max = 2000, step = 1),
    numericInput('n2', 'Sample Size 2', 100, min = 3, max = 2000, step = 1)
    
    #actionButton("goButton", "Go!")
  ),
  
  mainPanel(
    # Do the two plots 
    verbatimTextOutput('line1'),
    verbatimTextOutput('line2'),
    plotOutput('TwoHist')
    
  )
  
  
))



