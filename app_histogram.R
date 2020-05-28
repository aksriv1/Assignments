#
# This is a Shiny web application. Please run the application by clicking
# the 'Run App' button above.This particular application plots a histogram, 
# which is the frequency of the various values of a variable under 
# consideration in any data set.So, you can choose your dataset and your
# variable.
# This is a single file app in which User Interface (ui.R) and server processing
# (server.R) are done in a single file through R scripts. So your title panel
# and slider input can be varied depending upon the variability of the data.
# app.R has three components:
# a user interface object
# a server function
# and
# a call to the shinyApp function
# The server output is controlled through "render plot" in this app. This means
# that the app is reactive and automatically reexecutes when you change the 
# input.
# You can control this output by choosing any column of your data, the layout
# of the plot etc.
#
#
#

library(shiny)

# Define UI for an app that draws a histogram
ui <- fluidPage(

    # App title
    titlePanel("mtcars Data"),

    # Sidebar with a slider input for number of bins. The slider input enables 
    # you to see the plot variations as you change the histogram parameters.
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 10)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Now, server logic required to draw a histogram is spelt out through the
# undernoted R script:
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- mtcars[, 4]
        # above code takes a column from the mtcars dataset, the hp column
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'blue')
    })
}

# And finally, Run the application 
shinyApp(ui = ui, server = server)
