# Define server logic to plot various variables against mpg ----
library(shiny)

shinyServer(function(input,output){
  output$img1 <- renderUI({
    if(input$populatie == "tw"){            
      img(height = 300, width = 400, src = "twitter.png")
    }                                        
    else if(input$populatie == "cd"){
      img(height = 300, width = 400, src = "heatmap.png")
    }
    else if(input$populatie == "cdt"){
      img(height = 300, width = 400, src = "cdc vs twitter.png")
    }
  })
})


