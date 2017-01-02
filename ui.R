library(shiny)

fluidPage(
  tags$head(
    tags$style(HTML(".shiny-text-output {
                    color:#09c0f5; 
                    font-size:large;
                    font-weight:bold;
                    }"))
  ),
  
  headerPanel(
    h1("Baseball Prediction", style = 'color:#09c0f5')
  ),
  
  h3("Runs Scored by a Baseball Team", style = 'color:#09c0f5'),
  p(paste("This app uses data from the Joseph Adler data set.",
          "It comprises data from 2000 - 2008 for every major league baseball team,", 
          "applies a linear model which predicts the number of runs scored by a team",
          "and provide the prediction confidence interval based on the variables below.")),
  br(),
  p(paste("Use the sliders to adjust the inputs.",
          "The adjustment will impact on the number of runs scored",
          "and the resulting confidence interval.")),
  br(),
  
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        column(6,
               sliderInput("singles", "Singles:",
                           min = 0, max = 5000, value = 995, step = 1),
               sliderInput("doubles", "Doubles:",
                           min = 0, max = 1500, value = 309, step = 1),
               sliderInput("triples", "Triples:",
                           min = 0, max = 100, value = 34, step = 1),
               sliderInput("homeruns", "Home Runs:",
                           min = 0, max = 600, value = 236, step = 1)
      ),
      column(6,
             sliderInput("walks", "Walks:",
                         min = 0, max = 2000, value = 608, step = 1),
             sliderInput("hitbypitch", "Hit by Pitch:",
                         min = 0, max = 300, value = 93, step = 1),
             sliderInput("sacrificeflies", "Sacrifice Flies:",
                         min = 0, max = 150, value = 52, step = 1),
             sliderInput("stolenbases", "Stolen Bases:",
                         min = 0, max = 150, value = 47, step = 1),
             sliderInput("caughtstealing", "Caught Stealing:",
                         min = 0, max = 150, value = 43, step = 1))
    ),
    width = 8
  ),
  
  mainPanel(
    fluidRow(
      column(12,
             h4("Runs Scored Prediction:"),
             textOutput('estimatedRuns'),
             br(),
             h4("Confidence Interval:"),
             textOutput('ci'))
    ), width = 4
  )
  ),
  br(),
  p(style = 'color:#af09f5', 'Case study from',
    a("R in a Nutshell", 
      href="https://www.amazon.com/Nutshell-Desktop-Quick-Reference-OReilly/dp/144931208X"),
    "by Joseph Adler, 2010.")
)