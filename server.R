Vacc_Data <- read.csv("https://raw.githubusercontent.com/cpark00-1963343/INFO-201-Final-Deliverable-4709AB/main/us_state_vaccinations%20(2).csv%22)

library(shiny)

shinyServer(
  function(input, output, session) {
    data_date_range = reactive({
      Vacc_Data %>% filter(date>=input$Date1[1] & date<=input$Date1[2])
    })

    output$plot1 = renderPlot({
      ggplot(data_date_range(),aes_string(x="date",
                                          y=input$y.variable1,
                                          color="location"))+
        geom_bar(stat = "identity")+labs(title = paste("Distribution of",input$y.variable1),
                                         x="Date",y=input$y.variable1)+
        theme(legend.position = "top",axis.text.x = element_text(angle = 90))
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