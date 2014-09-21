library(shiny)
shinyServer(
function(input, output) {
  # Perform simulation to get the dataa
  data1<-reactive(replicate(input$numsim, mean(rpois(input$n1, input$lamda))))
  data2<-reactive(replicate(input$numsim, mean(rpois(input$n2, input$lamda))))
  
  # Generate the mean and standard deviation text
  output$line1<-renderText(paste("Sample size =", input$n1, ":  Sample Mean =",mean(data1()), ", Sample Standard deviation =", sd(data1())))
  output$line2<-renderText(paste("Sample size =", input$n2, ":  Sample Mean =",mean(data2()), ", Sample Standard deviation =", sd(data2())))
  
  # Generate the plots
  output$TwoHist <- renderPlot({
    par(mfrow=c(2,1))
    
    data1.mean<-mean(data1())
    data2.mean<-mean(data2())
    
    lowerlim<-min(data1(), data2())
    upperlim<-max(data1(), data2())

    hist(data1(), breaks=20, col="blue", xlim=c(lowerlim,upperlim), main=paste("Sample size =", input$n1))
    abline(v=data1.mean, col="red")
    hist(data2(), breaks=20, col="blue", xlim=c(lowerlim,upperlim), main=paste("Sample size =", input$n2))
    abline(v=data2.mean, col="red")
    

  }, height = 600, width = 800)

  }
)