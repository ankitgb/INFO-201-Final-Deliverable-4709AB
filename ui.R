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
    titlePanel(tags$style(),"USA State Vaccination"),
    navbarPage("Tab",
               tabPanel(tags$style(
                 ".navbar-nav li a{
                         font-size:18px;
                         font-weight:bold;
                         color:red;}
                         h1{
                         font-size:30px
                         font-weight:bold;
                         color:blue;
                         }
                         h2{
                         font-size:25px;
                         color:red;
                         }
                         p{
                         font-size:18px;
                         color:black;
                         }"
                 
               ),
               title = "Introduction",
               h1("Introduction"),
               imageOutput("covid_img"),
               p(" Looking at our past couple of years, a lot has 
                                  changed due to COVID-19 Pandemic that has taken 
                                  the world by storm. Mask mandates and little to 
                                  no social gatherings caused the world to fall 
                                  into a depression that is still reaping the world 
                                  today. Many mistakes were made in the world by 
                                  not taking action quickly enough to combat this 
                                  virus and the citizens often were ignorant or 
                                  did not fully understand the severity of this 
                                  pandemic situation. With these datasets and our 
                                  analysis, we hope to provide more education to 
                                  the public about the Virus and our resources to 
                                  combat it as long as COVID-19 is still present."),
               h2("Guiding Questions:"),
               p("1:How did the population of people in the US with 
                                  COVID increase as the pandemic continued and 
                                  resources declined?"),
               p("2:What was the location with the highest covid 
                                  infected population in 2020?"),
               p("3:What were the average number of hospitalizations 
                                  in 2020 in relationship to vaccination rate?"),
               p("4:In which location was the covid fatality rate the highest?"),
               h2("Dataset:"),
               p("This dataset is data that is derived from the organization Our 
                                  World in Data and their data on covid 19 and consists of state 
                                  by state observations about Covid 19 vaccinations around the United 
                                  States. Using this data, we can answer the questions regarding 
                                  vaccinations and hospitalizations. There are 33812 observations and 
                                  16 features in this dataset and the question that can be answered is 
                                  “What is the correlation between vaccination rates and hospitalization 
                                  rates between US States “?"),
               p("Some concerns about this dataset include many outliers and people that got 
                                  covid and were asymptomatic or did not seek treatment.")),
               tabPanel(title = "Vaccination in USA",
                        p("The following data visualization is meant
                                  to illustrate trend in vaccination at a 
                                  stated time range"),
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
                                  aginist the number of people distributed"),
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
               tabPanel(title = "Relationship between two Variabbles",
                        p("The following data visualization 
                                   illustrate the relationship between various 
                                   variables across different states at a 
                                  stated time range"),
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
                 "h1{
                         font-size:30px;
                         font-weight:bold;
                         color:blue;
                         }
                         p{
                         font-size:15px;
                         color:black;
                         }"
               ),
               title = "Conclusion",
               h1("Summary"),
               p(""),
               h1("Conclusion"),
               p(""))
               
               
    )
  )
)

