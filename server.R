library(shiny)

autoMPG <- function(hp, wt) {
    model <- lm(mpg ~ hp + wt, data=mtcars)
    start.mpg <- summary(model)$coefficients[1,1]
    change.hp <- summary(model)$coefficients[2,1]
    change.wt <- summary(model)$coefficients[3,1]
    
    start.mpg + change.hp * hp + change.wt * wt
}

shinyServer(
    function(input, output) {
        output$ohp <- renderPrint({input$hp})
        output$owt <- renderPrint({input$wt})
        output$mpg <- renderPrint({autoMPG(input$hp, input$wt)})
    }
)