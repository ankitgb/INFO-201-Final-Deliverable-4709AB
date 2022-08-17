Vacc_Data <- read.csv("https://raw.githubusercontent.com/cpark00-1963343/INFO-201-Final-Deliverable-4709AB/main/us_state_vaccinations%20(2).csv")

library(shiny)

library(shiny)

shinyServer(
  function(input, output, session) {
    output$covid.jpg <- renderImage({
      list(src = "covid.jpg",
           width="70%",height=400)
    },deleteFile = F)
    data_date_range = reactive({
      Vacc_Data %>% filter(date>=input$Date1[1] & date<=input$Date1[2])
    })
    
    output$plot1 = renderPlot({
      ggplot(data_date_range(),aes_string(x="date",
                                          y=input$y.variable1,
                                          color="location"))+
        geom_point()+labs(title = paste("Distribution of",input$y.variable1),
                          x="Date",y=input$y.variable1)+
        theme(legend.position = "bottom",axis.text.x = element_text(angle = 90),
              legend.direction = "horizontal")
    })
    
    data_location = reactive({
      Vacc_Data %>% 
        filter(date>=input$Date2[1] & date<=input$Date2[2])  %>% 
        filter(location==input$State1)
    })
    
    output$plot2 = renderPlot({
      ggplot(data_location(),aes_string(x="date",
                                        y=input$y.variable2))+
        labs(title = paste("Distribution of",input$y.variable2,"in",input$State1),
             x="Date",y=input$y.variable2)+
        geom_point()+theme(axis.text.x = element_text(angle = 90))
    })
    
    data_location1 = reactive({
      
      Vacc_Data %>% 
        filter(date>=input$Date3[1] & date<=input$Date3[2])  %>% 
        filter(location==input$State2)
    })
    output$plot3 = renderPlot({
      ggplot(data_location1(),aes_string(x=input$x.variable1,
                                         y=input$y.variable3))+
        labs(title = paste("Distribution of",input$y.variable3,"against",
                           input$x.variable1,"in",input$State2),
             x=input$x.variable1,y=input$y.variable3)+
        geom_point()+theme(axis.text.x = element_text(angle = 90))
    })
  }
)