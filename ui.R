
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
library(shinydashboard)
library()
dashboardPage(
  dashboardHeader(title = "Iris K-Means cluster"),
  dashboardSidebar(
    selectInput('xcol', 'X  variable', names(iris)[1:4]),
    selectInput('ycol', 'Y variable', names(iris)[1:4],
                selected = names(iris)[[2]]),
    numericInput('clusters', label = 'Cluster Count', value = 3,min=1,max=9)
  ),
  dashboardBody(
   # column(4,plotOutput("plot1"))
    box(title = "K-Means cluster plot",status = 'success',
        plotOutput("plot1"), width = 6),
    #column(4,DT::dataTableOutput("DT"))
    box(title = "use DT package plot",width = 4,
        DT::dataTableOutput("DT"), status = 'info',collapsible = T, solidHeader = T),
    column(4,tableOutput("head"))
  )
)