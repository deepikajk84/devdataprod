library(shiny)
shinyUI(fluidPage(
        titlePanel("Type of coffee - Regression Model"),
        img(src="images.png", height=72, width=72),
        sidebarLayout(
        sidebarPanel(sliderInput("caffine", label=h3("Select caffine %"), min=0, max=5,step=0.05, value=0.5),
                     sliderInput("fat", label=h3("Select fat %"), min=0, max=20,step=0.1, value=10)
        ),
        mainPanel(
                tabsetPanel(type="tabs",
                            tabPanel("Prediction:",textOutput("fittedValue"),plotOutput("Plot1"),plotOutput("Plot2")),
                            tabPanel("Model Summary",verbatimTextOutput("modsummary")),
               tabPanel("Model Efficiency",
                        verbatimTextOutput("confM"))
                )
                  ))
))
