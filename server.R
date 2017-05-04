
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyServer(function(input,output){
  cluster <- reactive({
    kmeans(iris[,1:4],centers = input$clusters)
  })
  output$plot1 <- renderPlot({
    plot(iris[,c(input$xcol, input$ycol)],
         col=cluster()$cluster)
    points(cluster()$centers[,c(input$xcol, input$ycol)],
           col = 1:input$clusters, pch="*", cex=4)
  })
  output$DT <- DT::renderDataTable({
    DT::datatable(iris[,c(input$xcol,input$ycol)])
  })
  output$head <- renderTable(
    head(iris[,c(input$xcol,input$ycol)], input$clusters)
  )
})