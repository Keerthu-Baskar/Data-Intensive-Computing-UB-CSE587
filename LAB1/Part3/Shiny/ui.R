library(shiny)

ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("Twitter Vs CDC Flu"),
  
  # Sidebar panel for inputs ----
  wellPanel(
    fluidRow(
      column(3, selectInput("populatie", label = h4("Maps"), 
                            choices = list("Twitter" = "tw", "CDC" = "cd", "CDC vs Twitter" = "cdt"),
                            selected = "tw"),
             uiOutput("img1")), # here is the image
      column(9, plotOutput("plot2"))
    )
  ),
  
  # Main panel for displaying outputs ----
  mainPanel()
)
#ui <- fluidPage(
 # titlePanel("My Shiny App"),
 #tags$div(img(src = "rstudio.png"))
 

#)