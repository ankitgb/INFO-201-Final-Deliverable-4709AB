library(shiny)
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)
library(shinythemes)
library(shinyauthr)
library(shinyWidgets)
library(plotly)

Vacc_Data <- read.csv("https://raw.githubusercontent.com/cpark00-1963343/INFO-201-Final-Deliverable-4709AB/main/us_state_vaccinations%20(2).csv")

shinyUI(
  fluidPage(
    theme = shinytheme(theme = "cerulean"),
    titlePanel("USA State Vaccination"),
    navbarPage("Tab",
               tabPanel(tags$style(
                 ".navbar-nav li a{
                         font-size:16px;
                         font-weight:bold;
                         color: red;}
                         .p{
                         font-size:15px;
                         color:blue;
                         }"
                 
               ),
               title = "Introduction",
               h1("Introduction"),
               p("Looking at our past couple of years, a lot has changed due to COVID-19 Pandemic that has taken the world by storm. Mask mandates and little to no social gatherings caused the world to fall into a depression that is still reaping the world today. Many mistakes were made in the world by not taking action quickly enough to combat this virus and the citizens often were ignorant or did not fully understand the severity of this pandemic situation. With these datasets and our analysis, we hope to provide more education to the public about the Virus and our resources to combat it as long as COVID-19 is still present. \n Guiding Questions: \n1.How did the population of COVID-19 vaccinated people change over time in 2021? \nHow does the total number of vaccinations distributed affect the number of vaccinated people in Washington in January, 2021?.")),
               tabPanel(title = "Vaccination in USA ",
                        p("The following data visualization is meant
                                  to illustrate trend in vaccination at a 
                                  stated time range."),
                        sidebarPanel(
                          dateRangeInput("Date1","Select Date:",
                                         start = "2020-12-20",
                                         end = "2022-08-03",
                                         min = "2020-12-20",
                                         max = "2022-08-03",
                                         format = "dd/mm/yy"),
                          
                          selectInput("y.variable1",
                                      "Select y.axis Variable:",
                                      choices = colnames(Vacc_Data[,-c(1,2)]))
                          
                        ),
                        mainPanel(
                          plotOutput("plot1")
                        )
               ),
               tabPanel(title = "Vaccination across the States",
                        p("The following data visualization is meant
                                  to illustrate trend in vaccination across
                                  different states at a stated time range 
                                  against the number of people distributed."),
                        sidebarPanel(
                          dateRangeInput("Date2","Select Date:",
                                         start = "2020-12-20",
                                         end = "2022-08-03",
                                         min = "2020-12-20",
                                         max = "2022-08-03",
                                         format = "dd/mm/yy"),
                          selectInput("State1","Select State:",
                                      choices = unique(Vacc_Data[,"location"])),
                          
                          selectInput("y.variable2",
                                      "Select y.axis Variable:",
                                      choices =  colnames(Vacc_Data[,-c(1,2)]))
                          
                        ),
                        mainPanel(
                          plotOutput("plot2")
                        )
               ),
               tabPanel(title = "Relationship between two Variables",
                        p("The following data visualization 
                                   illustrate the relationship between various 
                                   variables across different states at a 
                                  stated time range."),
                        sidebarPanel(
                          dateRangeInput("Date3","Select Date:",
                                         start = "2020-12-20",
                                         end = "2022-08-03",
                                         min = "2020-12-20",
                                         max = "2022-08-03",
                                         format = "dd/mm/yy"),
                          selectInput("State2","Select State:",
                                      choices = unique(Vacc_Data[,"location"])),
                          selectInput("x.variable1",
                                      "Select x.axis Variable:",
                                      choices =  colnames(Vacc_Data[,-c(1,2)])),
                          selectInput("y.variable3",
                                      "Select y.axis Variable:",
                                      choices =  colnames(Vacc_Data[,-c(1,2)]))
                          
                        ),
                        mainPanel(
                          plotOutput("plot3")
                        )
               ),
               tabPanel(tags$style(
                 ".h1{
                         font-size:20px;
                         font-weight:bold;
                         }
                         .h2{
                         font-size:17px
                         }
                         .p{
                         font-size:15px;
                         color:blue;
                         }"
               ),
               title = "Conclusion",
               h1("Summary"),
               p(""),
               h2("Conclusion"),
               p(""))
               
               
    )
  )
)