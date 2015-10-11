library(shiny)

autoMPG <- function(hp, wt, cyl) {
    model <- lm(mpg ~ hp + wt + factor(cyl), data=mtcars)
    start.mpg <- summary(model)$coefficients[1,1]
    change.hp <- summary(model)$coefficients[2,1]
    change.wt <- summary(model)$coefficients[3,1]
    change.cyl6 <- summary(model)$coefficients[4,1]
    change.cyl8 <- summary(model)$coefficients[5,1]
    
    change.cyl <- 0
    
    if(cyl == 6) {
        change.cyl <- change.cyl6
    } else if(cyl == 8) {
        change.cyl <- change.cyl6 + change.cyl8
    }
    
    start.mpg + change.hp * hp + change.wt * wt + change.cyl
}

shinyServer(
    function(input, output) {
        output$ohp <- renderText({paste("Horsepower: ", input$hp)})
        output$owt <- renderText({paste("Weight: ", input$wt, " tons")})
        output$ocyl <- renderText({paste("Number of Cylinders: ", input$cyl)})
        output$mpg <- renderText({paste(round(autoMPG(input$hp, input$wt, input$cyl), 3), " miles per gallon")})
    }
)