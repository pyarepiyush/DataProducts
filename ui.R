library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Diabetes prediction"        
                
                ),
    
    sidebarPanel(
      
      p('The application "Diabetes Prediction" helps you predict the risk of diabetes given the amount of blood glucose level for 3 consecutive days.'),
      p(' '),
    
      p('Enter the 3-day glucose reading in mg/dl'),
      numericInput('glucose1', 'Glucose mg/dl day1:', 90, min = 50, max = 200, step = 5),
      numericInput('glucose2', 'Glucose mg/dl day2:', 90, min = 50, max = 200, step = 5),
      numericInput('glucose3', 'Glucose mg/dl day3:', 90, min = 50, max = 200, step = 5),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      p('Table showing the Values you entered, and the corresponding prediction for Diabetes for those days.'),
      p('The predicted values is between 0 and 1(higher number indicates that the probability is high'),
      verbatimTextOutput("dataset"),

      plotOutput('plots'),
      p('Plot showing the Prediction for 3 days. ')
      
    )
  )
)