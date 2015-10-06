library(shiny)

shinyUI(fluidPage(
    titlePanel("Predicting Automobile MPG"),
    sidebarLayout(
        sidebarPanel(
            h3("Auto Characteristics"),
            helpText("Use the sliders to adjust the horsepower and weight values and see the effects on the MPG."),
            sliderInput("hp", "Horsepower", value=200, min=60, max=340, step=20),
            sliderInput("wt", "Weight (in tons)", value=3.5, min=1.5, max=5.5, step=0.5)
        ),
        mainPanel(
            p("Using the mtcars data set, this Shiny app will predict a vehicle's MPG 
              rating based on the horsepower and weight values."),
            h3("Your vehicle settings"),
            textOutput("ohp"),
            textOutput("owt"),
            h3("Predicted fuel efficiency"),
            textOutput("mpg")
            )
    )
))
