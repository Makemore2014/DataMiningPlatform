library(shiny)
library(datasets)
#We tweak the "am" fileld to have nicer factor labels.Since this doesn't
#rely on any user inputs we can do this once at startup and then use the
#value throughout the lifetime of the application
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))
#Define server logic required to plot various varibles against mpg
shinyServer(function(input,output){
   
  #Compute the formula text in a rective expression since ti is
  #shared by the output$caption and output$mpgPlot expression
  formulText <- reactive({
    paste("mpg~", input$variable)
  })
  #Return the formula text for printing as a caption
  output$caption <- renderText({
    formulText()
  })
   #Generate a plot of the requested variavle against mpg and only
   #include outliers if requested
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulText()),
            data = mpgData,
            outline = input$outliers)
    
  })
})