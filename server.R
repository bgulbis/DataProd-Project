library(shiny)

model <- lm(mpg ~ hp + wt, data=mtcars)
change.hp <- summary(model.b)$coefficients[2,1]
change.wt <- summary(model.b)$coefficients[3,1]

shinyServer(
    function(input, output) {
        
    }
)