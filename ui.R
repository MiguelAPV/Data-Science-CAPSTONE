#
# 
#
#
#--------------------------------------------------
# R UI Code for the Capstone Project Shiny App
#--------------------------------------------------

suppressWarnings(library(shiny))

shinyUI(fluidPage(
  
  # Application title
  navbarPage("Data Science Capstone Word Prediction ",
             tabPanel("Home"),
             tabPanel("Ngram description", 
                      dataTableOutput("table")),
             navbarMenu("Method",
                        tabPanel("Description", p("The method we performed its based mainly creating ngrams from one to six, and using them into the prediction model. Each ngram contains a sequence of words and its frequency, as a count and as a relative frequency.")),
                        tabPanel("Code", p('Check it out on my github account <https://github.com/MiguelAPV/Data-Science-CAPSTONE>')))
  ),
  
  # Sidebar layout
  sidebarLayout(
    
    sidebarPanel(
      textInput("sentence", " Tipe something to predict bellow ", value = "I want to eat a"),
      sliderInput("obs", "maximum predictions:",
                  min = 0, max = 30, value = 10
      ),
      radioButtons("show_table", "Show ngram result table?",
                   c("show",
                     "hide"))
    ),
    
    mainPanel(
      h4("Sentence"),
      verbatimTextOutput("text"),
      
      h4("Prediction"),
      verbatimTextOutput("prediction"),
      
      mainPanel(plotOutput('dataset')),
      br(),
      br(),
      dataTableOutput("output_dataset")
    )
  )
))

