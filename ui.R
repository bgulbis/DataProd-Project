library(shiny)

shinyUI(fluidPage(
    titlePanel("Predicting Automobile Fuel Efficiency"),
    sidebarLayout(
        sidebarPanel(
            h3("Auto Characteristics"),
            helpText("Use the sliders to adjust the horsepower and weight values, 
                     or the radio button to select the number of cylinders."),
            sliderInput("hp", "Horsepower", value=200, min=60, max=340, step=20),
            sliderInput("wt", "Weight (in tons)", value=3.5, min=1.5, max=5.5, step=0.5),
            radioButtons("cyl", label = p("Number of Cylinders"),
                         choices = list("4 Cylinders" = 4, "6 Cylinders" = 6,
                                        "8 Cylinders" = 8),selected = 4)
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Output",
                         h3("Your vehicle settings"),
                         textOutput("ohp"),
                         textOutput("owt"),
                         textOutput("ocyl"),
                         h3("Predicted fuel efficiency"),
                         textOutput("mpg")
                ),
                tabPanel("Help", 
                         h4("Purpose of this app"),
                         p("Recent events have revealed that some automobile manufacturers 
                           have created certain modifications to their vehicles which 
                           resulted in falsely-high fuel efficiency ratings during 
                           government testing. As a results, consumers may be left 
                           wondering how accurate the information provided by the 
                           manufacturers really is. This app uses a prediction model 
                           based upon the mtcars data set to estimate a vehicle's fuel 
                           efficiency (measured in miles per gallon, or MPG), using 
                           only a vehicle's gross horsepower, weight, and the number of cylinders."),
                         h4("How to use this app"),
                         p("To estimate a vehicle's fuel efficiency, input the automobile's 
                           horsepower and weight (in tons) using the sliders in the 
                           Auto Characteristics panel. The number of cylinders can be 
                           adjusted using the radio buttons. The estimated fuel efficiency 
                           (in MPG) will be calculated and displayed under the Output tab. 
                           As you adjust the input values, the estimated fuel efficiency 
                           will automatically update based upon the new values.")
                    
                )
            )
        )
    )
))
