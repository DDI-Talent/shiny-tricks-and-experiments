if (!require(shiny)) { install.packages("shiny") }
if (!require(tidyverse)) { install.packages("tidyverse") }
if (!require(urltools)) { install.packages("urltools") }
library(shiny)
library(tidyverse)
library(urltools)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("What can your url tell you?"),
  mainPanel(
    textOutput("url_details")
  )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  url_information <- reactiveValues(
    color = "",
    name = ""
  )
  
  observe({ # see # https://shiny.posit.co/r/articles/build/client-data/
    # once you run your shiny, go to something like eg. http://127.0.0.1:3931/?color=yellow&name=banana
    # or otherwise add ? after your url, and then pass variables like var1_name=value&var2_name=value
    result <- param_get(session$clientData$url_search, c("color","name"))
    url_information$color <- result$color
    url_information$name <- result$name
  })
  
  output$url_details <- renderText({
    return(paste("info from url:","name:", url_information$name,"color:",url_information$color,"size:",url_information$size, colapse = ","))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
