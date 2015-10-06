library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Predicting Automobile MPG"),
    sidebarPanel(
        h3("Auto Characteristics"),
        sliderInput('hp', 'Pick the vehicle Horsepower', value=140, min=50, max=340, step=10),
        sliderInput('wt', 'Pick the vehicle Weight (in tons)', value=3.5, min=1.5, max=5.5, step=0.5)
    ),
    mainPanel(
        p("Using the mtcars data set, this Shiny app will predict a vehicle's MPG 
          rating based on the horsepower and weight values. Use the sliders to 
          adjust the horsepower and weight values and see the effects on the MPG."),
        h3("You selected:"),
        h4("Horsepower: "),
        verbatimTextOutput("ohp"),
        h4("Weight: "),
        verbatimTextOutput("owt"),
        h3("The predicted MPG for this automobile is:"),
        verbatimTextOutput("mpg")
    )
))
