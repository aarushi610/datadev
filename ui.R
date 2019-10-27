library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    checkboxGroupInput("variable", "Variables:",
                       c("Overall Results" = "Overall",
                         "Team 1 Results" = "Team1",
                         "Team 2 Results" = "Team2",
                         "Team 3 Results" = "Team3")),
    tableOutput("data")
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    output$data <- renderTable({
        Perform[, c("Performance.Measures", input$variable), drop = FALSE]
    }, rownames = TRUE)
}

# Run the application 
shinyApp(ui = ui, server = server)