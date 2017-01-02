library(shiny)
library(nutshell)
library(lattice)

data("team.batting.00to08")

runs.mdl <- lm(
  formula=runs~singles+doubles+triples+homeruns+
    walks+hitbypitch+sacrificeflies+
    stolenbases+caughtstealing,
  data=team.batting.00to08)

shinyServer(
  function(input, output) {
    predictions <- reactive({
      newdata <- data.frame(singles=as.numeric(input$singles),
                            doubles=as.numeric(input$doubles),
                            triples=as.numeric(input$triples),
                            homeruns=as.numeric(input$homeruns),
                            walks=as.numeric(input$walks),
                            hitbypitch=as.numeric(input$hitbypitch),
                            sacrificeflies=as.numeric(input$sacrificeflies),
                            stolenbases=as.numeric(input$stolenbases),
                            caughtstealing=as.numeric(input$caughtstealing))
      predictions <- predict(runs.mdl,newdata, interval="confidence")
      predictions
    })
    
    output$estimatedRuns <- renderText({ round(predictions()[1],digits=0) })
    output$ci <- renderText({ paste(round(predictions()[2],digits=0), "-", 
                                    round(predictions()[3],digits=0)) })
  }
)