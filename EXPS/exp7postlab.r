data(mtcars)

library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point()

library(plotly)

plot_ly(mtcars, x = ~hp, y = ~mpg, text = rownames(mtcars), hoverinfo = "text",
        mode = "markers", marker = list(size = 10, opacity = 0.8)) %>%
  layout(title = "Interactive Scatter Plot of mpg vs. horsepower")

library(shiny)

ui <- fluidPage(
  titlePanel("mtcars Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("cyl_input", "Number of cylinders:",
                  choices = unique(mtcars$cyl),
                  selected = unique(mtcars$cyl)[1])
    ),
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)

server <- function(input, output) {
  output$scatterplot <- renderPlot({
    filtered_mtcars <- subset(mtcars, cyl == input$cyl_input)
    ggplot(filtered_mtcars, aes(x = wt, y = mpg)) +
      geom_point()
  })
}

shinyApp(ui, server)
