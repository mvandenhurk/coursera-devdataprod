library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Body Mass Index (BMI) Calculator"),
        sidebarPanel(
                p('Body Mass Index (BMI) is an indicator of your risk for developing diseases commonly associated with higher body fat.'),
                p('In general, the higher the BMI the higher your risk for diseases such as heart disease, type II diabetes and high blood pressure. However, please be aware that: (1) BMI may overestimate body fat in individuals with muscular build, such as athletes; and that (2) BMI may underestimate body fat in people who have lost muscle, such as some elderly persons.'),        
                p('Calculate your BMI below by entering your height and weight, and clicking the "Calculate BMI" button.'),
                radioButtons(
                        inputId = "units",
                        label = "Units:",
                        choices = c("STANDARD (inches, pounds)" = "std", "METRIC (centimeters, kilograms)" = "metr")
                ),
                numericInput(
                        inputId = "height",
                        label = "Your Height:",
                        value = 0,
                        min = 0
                ),
                numericInput(
                        inputId = "weight",
                        label = "Your Weight:",
                        value = 0,
                        min = 0
                ),
                actionButton("goButton", "Calculate BMI")
        ),
        mainPanel(
                h4('Your Entered Height:'),
                uiOutput("inputHeight"),
                h4('Your Entered Weight:'),
                uiOutput("inputWeight"),
                h4('Your Calculated BMI:'),
                uiOutput("result"),
                h4('BMI Category:'),
                uiOutput("category")
        )
))