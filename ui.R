library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Predicting Automobile MPG"),
    sidebarPanel(
        h3("Auto Characteristics"),
        sliderInput('hp', 'Pick the HP', value=140, min=50, max=340, step=10),
        sliderInput('wt', 'Pick the Weight (tons)', value=3.5, min=1.5, max=5.5, step=0.5)
    ),
    mainPanel(
        p("Output goes here")
    )
))
