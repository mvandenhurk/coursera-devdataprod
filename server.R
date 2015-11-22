library(shiny)

convfact <- 703
BMI <- function(height, weight, units) {
        if (units == "std") {
                BMI <- weight / height^2 * convfact
        } else {
                BMI <- weight / (height / 100)^2
        }
}

shinyServer(
        function(input, output) {
                output$inputHeight <- renderText({
                        if (input$units == "std") {
                                heightUnit <- "inches"
                        } else {
                                heightUnit <- "centimeters"
                        }
                        paste(input$height, heightUnit)
                })
                output$inputWeight <- renderText({
                        if (input$units == "std") {
                                weightUnit <- "pounds"
                        } else {
                                weightUnit <- "kilograms"
                        }
                        paste(input$weight, weightUnit)
                })
                result <- eventReactive(input$goButton, {
                        BMI <- BMI(units = input$units, height = input$height, weight = input$weight)
                        round(BMI, 1)
                })
                output$result <- renderText({
                        result()
                })
                category <- eventReactive(input$goButton, {
                        BMI <- BMI(units = input$units, height = input$height, weight = input$weight)
                        if (BMI < 18.5) statement <- "UNDERWEIGHT"
                        else if (BMI < 25) statement <- "NORMAL WEIGHT"
                        else if (BMI < 30) statement <- "OVERWEIGHT"
                        else if (BMI < 40) statement <- "OBESE"
                        statement
                })
                output$category <- renderText({
                        category()
                })
        }
)