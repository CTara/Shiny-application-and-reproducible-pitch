# ---
# title:  "Next Word Prediction Using N-Grams (Good-Turing Smoothing)"
# subtitle:   "Data Science Capstone Final Project Report"
# author: "Chandra Tara Lama"
# date:   "2016-05-29 00:00:00"
# ---

# ui.R


source("sharedheader.R")

library(shiny)

shinyUI(fluidPage(
    titlePanel("Words Prediction Using N-Grams (Good-Turing Smoothing)"),
    sidebarLayout(
        sidebarPanel(width=4,
            h3("Application Introduction"),
            p("This app predicts the next English word of a sentence, using an n-gram based text prediction model with smoothing."),
            p("Start typing your sentence in the text box. When you finish typing the predicted next word is displayed immediately."),
            p("If the show other probabal words is true, details is shown with word cloud. Else just the next word is shown."),
            HTML("<br/><br/>"),
            
            #p("Text Prediction Model Status:",textOutput("model.status",inline=TRUE)),
            #selectInput("tssample", "Select training sample percentage:", tslist, multiple=FALSE, selected=tslist.selected),

            fluidRow(
                #column(3, 
                #       p("Training data size:", textOutput("ng.size", inline=TRUE))
                #       )
                #column(9, 
                #       span("Load time: ", HTML("<span style='font-size:small;'>(Please allow for up to 15 seconds)</span>"), htmlOutput("ng.loadtime"))
                #       )
            ),
            #p("Size:", textOutput("ng.size", inline = TRUE)),
            #span("Load time (sec):", htmlOutput("ng.loadtime")),
            
            #HTML("<br/>"), p("Prediction time:", textOutput("ng.predtime", inline=TRUE)),
            
            #HTML("<br/>"),
            
            radioButtons("showcandidates", "Show other probabal words:", c("True", "False"), selected="True", inline = TRUE),
            
            HTML("<br/><br/>"),
            
            p("Training set data:", textOutput("ngrams.info1", inline=TRUE)),
            
            tableOutput("ngrams.info2")        
        ),
        mainPanel(width = 8,
                  column(5, 
                         HTML("<br>"),
                         strong(p("Enter your text:", style="margin-bottom:-10px;")),
                         textInput("inputtext", label="", value="I love"),
                         
                         HTML("<br>"),
                         
                         p("You typed:"),
                         #HTML("<div style='padding-left:10px; height:30px;'>"), 
                         HTML("<em>"), textOutput("inputecho"), HTML("</em>"),
                         #HTML("</div>"),
                         
                         HTML("<br>"),
                         
                         p("The suggested next word is:"),
                         #HTML("<div style='padding-left:10px; height:30px; font-weight:bold;'"), 
                         strong(textOutput("prediction")), 
                         #HTML("</div>"), 
                         
                         HTML("<br><br>"),
                         
                         conditionalPanel(condition = "input.showcandidates == 'True'",
                                          p("Cloud of probabal words :"),
                                          plotOutput("ngrams.info3", height=500)
                         )
                  ),
                  column(6, offset=1, 
                       fluidRow(
                           conditionalPanel(condition = "input.showcandidates == 'True'", 
                                            fluidRow(
                                                p("As selected from the following words:"),
                                                tableOutput("candidates")
                                            )
                           )
                       )
                  )
        )
    ) #sidebarLayout
)) # fluidPage shinyUI

