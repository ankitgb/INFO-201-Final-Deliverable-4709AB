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
               imageOutput("covid.jpg"),
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
               p("1) How did the population of COVID-19 vaccinated 
                 people change over time in 2021?"),
               p("2) How did the number of total distributed vaccinations change in 
                 Washington State over time in January, 2021?"),
               p("3) How does the total number of vaccinations distributed affect the number 
               of vaccinated people in Washington in January, 2021?"),
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
                        p("The following data visualization is meant to represent the trend in total vaccinations within January 2021. Each state is represented within the plot with a different color in order to show the difference between each of the 50 states trends within the United States of America. If you select 'total_vaccinations' from the drop down menu for the y-axis, select start date as '01/01/2021', and end date as '02/02/2021', the code will create plot 1 which shows the total number of vaccinations that occurred over the month of January 2021. Some patterns that I have noticed within the data are that Washington State (colored in Pink) has a significantly higher vaccination rate than the other states in America. As the year began, people started with a low daily amount of vaccinations but this quickly increased from 0 vaccinations at the start of the month all the way to 3*10^7 vaccinations by the start of February. Out of all the states, the southern-most states seem to have the least amount of total vaccinations by the end of January followed by the midwest states. One general trend that we have observed after creating these interactive plots with the data is that people are generally increasing their rates of vaccination as time goes on, yet some states are falling behind others in the race to get fully vaccinated. As you dive deeper into our project exploring the interactive pages regarding COVID-19 vaccination trends in the United States, many new variables will arise such as total distribution. Continue to explore the next few interactive pages to further your understanding of COVID-19 trends within America with more specific variables."),
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
                                  against the number of people distributed.
                                  Within the given dataset, we are able to
                                  select the state of Washington and the desired
                                  date, ranging between 01/01/21 to 01/31/21 in
                                  in order to obeserve the total number of 
                                  distributed vaccincations in WA in the given
                                  time frame"),
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
                                  stated time range. The two variables that we decided to look at in this chart are the number of vaccinations distributed in Washington in January 2021 and its relationship with the number of people vaccinated in Washington in January 2021. From looking at our previous questions and variables that we looked at, we decided to put the two together to analyze the specifics about the relationship. As you can see in the graph created after inputting these two variables, the relationship is quite positive, where as the number of distributed vaccines increases, the number of people getting vaccinated also increases tremendously. There are several things that could have affected these results such as people resistant to vaccinations and inaccurate inventories of doses of vaccines distributed and shipped out. These factors were taken into account when creating this application and take impact in our results and findings. This plot is created to be a scatterplot so we can see the relationship and create a trend line if necessary to display a pattern."),
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
               p("A key takeaway in the Vaccination in the USA chart is that all the states in the United States of America have the same general positively correlated trend between the amount of time that has passed in a month and the total number of vaccinations that have administered to citizens of the United States. As time goes on, the results can be viewed in a positive way as more and more people are being informed about the benefits to COVID-19 vaccination and being influenced to go get vaccinated. Washington State and the West Coast States seem to be the areas with the most total vaccinations, yet the other states are well on their way to increasing their vaccination rates as well.
                  A key takeaway in the Vaccination across the States chart is that
                 A key takeaway in the relationship between two variables chart is that there is a strong direct positive relationship between the variables vaccines distributed and vaccines administered in Washington State in January of 2021. These results can be viewed in many different ways but this indication of a strong positive correlation signifies that as more vaccines are getting distributed, more people are getting vaccinated in Washington. This ideology can be seen not just in Washington, but in the rest of the world in the struggle against COVID-19."),
               h1("Conclusion"),
               p("There were strong patterns in all of our charts and datasets however when diving closely into states rather than the United States of America as a whole, the patterns were tremendously clear and easy to spot.
                 The first notable pattern that was noticed in Plot 1 when relating time to total vaccinations throughout all the States in America was that all of the states increased from a very low number of vaccinations such as 0-100 vaccinations and increased to about 30000000 total vaccinations within some of the states at the end of January. This continued to increase as time goes on, allowing the pandemic scientists to be better prepared to solve future situations such as COVID-19.
                 
                 The last notable pattern occurred in the Relationship between Two Variables Chart. As the total number of vaccinations distributed in Washington increased on the X-Axis, the number of total vaccinations being administered trended upwards as well throughout the month of January in 2021. In the beginning of the month, there were less than 600000 doses of vaccinations being distributed in Washington and as the number increased to over 1000000 vaccinations doses being distributed, the total vaccinations increased from 200000 to over 700000. I chose to examine these specific time period in Washington because there is a lot of influx of vaccinations and others treatments for the COVID-19 Virus. Some broader implications of this chart include similar patterns emerging around the world as the COVID Virus rages on and people can use this information in order to be better prepared in the future for pandemics and improve public vaccination rates."))
               
               
    )
  )
)

