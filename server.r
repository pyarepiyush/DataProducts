library(shiny)

diabetesRisk <- function(glucose) glucose / 200
x = c(1,2,3)


shinyServer(
  function(input,output) {
  
  input1 <- reactive({c(as.numeric(input$glucose1),as.numeric(input$glucose2),as.numeric(input$glucose3)   )})
             

  prediction = reactive( {as.numeric( diabetesRisk(input1()) ) } )
  
  output$dataset <- renderPrint({data.frame(InputValues= input1(), Prediction = prediction(), row.names = c("Day1:", "Day2:", "Day3:")      )})  
    
  output$inputValues <- renderPrint({paste( "Day1:", input$glucose1, 
                                            "Day2:", input$glucose2, 
                                            "Day3:", input$glucose3 )}) 
  output$prediction = renderPrint({prediction() })

    
  output$plots <- renderPlot({
    par(mfrow = c(1, 1))
  
    plot(x, prediction() ,type="l", col="red", xaxt='n', xlab = "Day", ylab="Prediction of Diabetes based on the Glucose mg/dl")
    axis(1,x)
    
  })
  
  
                    
  
})