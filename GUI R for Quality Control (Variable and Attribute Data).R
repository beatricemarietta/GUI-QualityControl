library(shiny)
library(shinythemes)
library(shinyWidgets)
library(ggplot2)
library(qcc)

ui <- fluidPage(
  themeSelector(),
  titlePanel("Quality Control"),
  navbarPage("by Beatrice Marietta",
             navbarMenu("Quality Control Chart",icon = icon("chart-line"),
                        tabPanel("Variable Data", icon = icon("plus"),
                                 sidebarLayout(
                                   sidebarPanel(
                                     h4("Quality Control Chart of Variable Data", align = "center"),
                                     fileInput("data1","Input Data Here",accept = ".txt",placeholder = "Choose .txt file"),
                                     prettyRadioButtons("ctyp1","Chart Type",choices = c("XBar Chart"=1,
                                                                                   "R Chart"=2,
                                                                                   "S Chart"=3),
                                                  selected = 1,
                                                  icon = icon("angle-right"), 
                                                  bigger = TRUE,
                                                  status = "info",
                                                  animation = "smooth"
                                                  ),
                                     numericInput("sn","Column of Sample Group",value = 1,min = 1),
                                     numericInput("x","Column of Sample (X)",value = 1,min = 1),
                                     actionBttn("ok1","OK",style = "jelly",icon = icon("play"),color = "danger",size = "sm")
                                   ),
                                   mainPanel(
                                     tabsetPanel(
                                       tabPanel("Table",
                                                h3("Table Output", align = "center"),
                                                tableOutput("myTbl1"),
                                                icon = icon("table")
                                       ),
                                       tabPanel("QC Chart",
                                                h3("Quality Control Chart", align = "center"),
                                                imageOutput("myImage1"),
                                                icon = icon("chart-area")
                                       ),
                                       tabPanel("Summary",
                                                h3("Descriptive Statistics", align = "center"),
                                                verbatimTextOutput("myTxt1"),
                                                icon = icon("bars")
                                       )
                                     )
                                   )  
                                 )
                        ),
                        tabPanel("Attribute Data",icon = icon("plus"),
                                 sidebarLayout(
                                   sidebarPanel(
                                     h4("Quality Control Chart of Attribute Data", align = "center"),
                                     fileInput("data","Input Data Here",accept = ".txt",placeholder = "Choose .txt file"),
                                     prettyRadioButtons("ctyp","Chart Type",choices = c("P Chart"=1,
                                                                                  "NP Chart"=2,
                                                                                  "C Chart"=3,
                                                                                  "U Chart"=4),
                                                  selected = 1,
                                                  icon = icon("angle-right"), 
                                                  bigger = TRUE,
                                                  status = "info",
                                                  animation = "smooth"
                                                  ),
                                     numericInput("ss","Column of Sample Size",value = 1,min = 1),
                                     numericInput("def","Column of Defective",value = 1,min = 1),
                                     actionBttn("ok","OK",style = "jelly",icon = icon("play"),color = "danger",size = "sm")
                                   ),
                                   mainPanel(
                                     tabsetPanel(
                                       tabPanel("Table",
                                                h3("Table Output", align = "center"),
                                                tableOutput("myTbl"),
                                                icon = icon("table")
                                       ),
                                       tabPanel("QC Chart",
                                                h3("Quality Control Chart", align = "center"),
                                                imageOutput("myImage"),
                                                icon = icon("chart-area")
                                       ),
                                       tabPanel("Summary",
                                                h3("Descriptive Statistics", align = "center"),
                                                verbatimTextOutput("myTxt"),
                                                icon = icon("bars")
                                       )
                                     )
                                   )  
                                 )
                        )
             ),
    tabPanel("Single Sampling Plan", icon = icon("check"),
      sidebarLayout(
        sidebarPanel(
          prettyRadioButtons("curve","Curve Type",
                             choices = c("Operating Characteristic (OC) Curve"=1,
                                         "Average Outgoing Quality (AOQ) Curve"=2,
                                         "Average Total Inspection (ATI) Curve"=3),
                      selected = 1,
                      icon = icon("check"), 
                      bigger = TRUE,
                      status = "danger",
                      animation = "pulse"
                      ),
          numericInput("N","Lot Size:",value = 3000,min = 500),
          numericInput("n","Sample Size:",100,min = 0,max = 500,step = 10),
          sliderInput("c","Acceptance Number:",5,min = 1,max = 50,animate = T),
          pickerInput("pltyp","Plot Type",selected = "o",
                      choices = c("Points"="p",
                                  "Lines"="l",
                                  "Points & Lines"="b",
                                  "Lines Part Alone"="c",
                                  "Overplotted"="o",
                                  "Histogram"="h",
                                  "Stair Steps"="s"
                                  ),
                      options = list(style = "btn-primary")
                      ),
          colorPickr("clr","Plot Color",selected = "#161853"),
        ),
        mainPanel(
          tabsetPanel(type = "pills",
            tabPanel("Plot",
              h3("Plot Output",align = "center"),
              icon = icon("chart-area"),
              plotOutput("plt"),
              sliderInput("p","Lot Fraction Defective",value = c(0.001,0.2),min=0.0001,max=0.5,width = "100%"),
              sliderInput("r","Range",0.01,min=0,max=0.1,step=0.001,width = "100%")
            ),
            tabPanel("Table",icon = icon("table"),
                     h3("Table Output",align = "center"),
                     tableOutput("tbl")
            ),
            tabPanel("Descriptive Statistics",
              h3("Descriptive Statistics",align = "center"),
              verbatimTextOutput("stat"),
              icon = icon("bars")
            )
          )
        )
      )
    ),
    tabPanel("Double Sampling Plan", icon = icon("check-double"),
      sidebarLayout(
        sidebarPanel(width = 4,
          prettyRadioButtons("curve2","Curve Type",choices = c("Operating Characteristic (OC) Curve"=1,
                                                         "Operating Characteristic (OC) Curve of Pa1"=2,
                                                         "Operating Characteristic (OC) Curve of Pa2"=3,
                                                         "Average Outgoing Quality (AOQ) Curve"=4,
                                                         "Average Total Inspection (ATI) Curve"=5),
                        selected = 1,
                        icon = icon("check"), 
                        bigger = TRUE,
                        status = "danger",
                        animation = "pulse"
                        ),
          numericInput("N2","Lot Size:",value = 3000,min = 100),
          splitLayout(
            verticalLayout(
              h4("First Sample"),
              numericInput("n1","Sample Size:",value = 40,min = 1),
              sliderInput("c1","Acceptance Number:",value = 1,min = 0,max = 50),
              sliderInput("d1","Defective Number:",value = 5,min = 0,max = 50)
            ),
            verticalLayout(
              h4("Second Sample"),
              numericInput("n2","Sample Size:",value = 80,min = 1),
              sliderInput("c2","Acceptance Number:",value = 5,min = 0,max = 50),
              sliderInput("d2","Defective Number:",value = 6,min = 0,max = 50)
            )
          ),
        ),
        mainPanel(
          tabsetPanel(type = "pills",
            tabPanel("Plot",
                     h3("Plot Output",align = "center"),
                     icon = icon("chart-area"),
                     plotOutput("plt2"),
                     sliderInput("p2","Lot Fraction Defective",value = c(0.001,0.2),min=0.0001,max=0.5,width = "100%"),
                     sliderInput("r2","Range",0.01,min=0.0001,max=0.1,step=0.001,width = "100%")
            ),
            tabPanel("Table",
                     h3("Table Output",align = "center"),
                     tableOutput("tbl2"),
                     icon = icon("table")
            ),
            tabPanel("Descriptive Statistics",
                     h3("Descriptive Statistics",align = "center"),
                     verbatimTextOutput("stat2"),
                     icon = icon("bars")
            )
          )
        )
      )
    )
  )
)

server <- function(input, output,session){
  output$myTbl1<-renderTable({
    if (is.null(input$data1)){(return())}
    outfile<-tempfile(fileext = '.png')
    png(outfile, width = 700, height = 550)
    mydt1=input$data1
    dt1=read.delim(mydt1$datapath, header = T)
  })
  observeEvent(input$ok1,{
    if (is.null(input$data1)){
      sendSweetAlert(
        session = session,
        title = "Error...",
        text = "No data",
        type = "error"
      )}
    else {
      sendSweetAlert(
        session = session,
        title = "Success !!!",
        text = "Your data has been processed successfully!",
        type = "success"
      )}
    output$myImage1<-renderImage({
      outfile1<-tempfile(fileext = '.png')
      png(outfile1, width = 700, height = 550)
      mydt1=input$data1
      dt1=read.delim(mydt1$datapath, header = T)
      sn=dt1[,input$sn]
      X=qcc.groups(dt1[,input$x],sn)
      if (input$ctyp1==1){
        xbar_chart=qcc(X,type = "xbar")
      }
      if (input$ctyp1==2){
        R_chart=qcc(X,type = "R")
      }
      if (input$ctyp1==3) {
        S_chart=qcc(X,type = "S")
      }
      dev.off()
      
      list(src = outfile1,
           contentType = 'image/png',
           width = 700,
           height = 550
      )
    },deleteFile = TRUE)
    output$myTxt1<-renderPrint({
      if (is.null(input$data1)){(return())}
      outfile1<-tempfile(fileext = '.png')
      png(outfile1, width = 700, height = 550)
      mydt1=input$data1
      dt1=read.delim(mydt1$datapath, header = T)
      summary(dt1)
    })
  })
  output$myTbl<-renderTable({
    if (is.null(input$data)){(return())}
    outfile<-tempfile(fileext = '.png')
    png(outfile, width = 700, height = 550)
    mydt=input$data
    dt=read.delim(mydt$datapath, header = T)
  })
  observeEvent(input$ok,{
    if (is.null(input$data)){
      sendSweetAlert(
        session = session,
        title = "Error...",
        text = "No data",
        type = "error"
      )}
    else {
      sendSweetAlert(
        session = session,
        title = "Success !!!",
        text = "Your data has been processed successfully!",
        type = "success"
      )}
    output$myImage<-renderImage({
      
      outfile<-tempfile(fileext = '.png')
      png(outfile, width = 700, height = 550)
      mydt=input$data
      dt=read.delim(mydt$datapath, header = T)
      ss=dt[,input$ss]
      Defective=dt[,input$def]
      if (input$ctyp==1){
        p_chart=with(dt,qcc(Defective,ss,type = "p"))
      }
      if (input$ctyp==2){
        np_chart=with(dt,qcc(Defective,ss,type = "np"))
      }
      if (input$ctyp==3){
        c_chart=with(dt,qcc(Defective,ss,type = "c"))
      }
      if (input$ctyp==4){
        u_chart=with(dt,qcc(Defective,ss,type = "u"))
      }
      dev.off()
      
      list(src = outfile,
           contentType = 'image/png',
           width = 700,
           height = 550
      )
    },deleteFile = TRUE)
    output$myTxt<-renderPrint({
      if (is.null(input$data)){(return())}
      outfile<-tempfile(fileext = '.png')
      png(outfile, width = 700, height = 550)
      mydt=input$data
      dt=read.delim(mydt$datapath, header = T)
      summary(dt)
    })
  })
  
  #---------------------------------------1---------------------------------------#
  output$plt<-renderPlot({
    N<-input$N
    n<-input$n
    c<-input$c
    p<-seq(input$p[1],input$p[2],by=input$r)
    Pa<-pbinom(c,n,p)
    AOQ<-p*Pa*(N-n)/N
    ATI<-n+(1-Pa)*(N-n)
    if (is.null(input$clr)){
      (return())
    }
    if (input$curve==1){
      plot(p,Pa,col = input$clr, type = input$pltyp)
    }
    if (input$curve==2){
      plot(p,AOQ,col = input$clr, type = input$pltyp)
    }
    if (input$curve==3){
      plot(p,ATI,col = input$clr, type = input$pltyp)
    }
  })
  output$stat<-renderPrint({
    N<-input$N
    n<-input$n
    c<-input$c
    p<-seq(input$p2[1],input$p[2],by=input$r)
    Pa<-pbinom(c,n,p)
    AOQ<-p*Pa*(N-n)/N
    ATI<-n+(1-Pa)*(N-n)
    tb=data.frame(p,Pa,AOQ,ATI)
    summary(tb)
  })
  output$tbl<-renderTable({
    N<-input$N
    n<-input$n
    c<-input$c
    p<-seq(input$p[1],input$p[2],by=input$r)
    Pa<-pbinom(c,n,p)
    AOQ<-p*Pa*(N-n)/N
    ATI<-n+(1-Pa)*(N-n)
    a=length(p)
    x=c(1:a)
    tb=data.frame("No"=x,p,Pa,AOQ,ATI)
  })

  #---------------------------------------2---------------------------------------#
  output$plt2<-renderPlot({
    N2<-input$N2
    n1<-input$n1
    c1<-input$c1
    d1<-input$d1
    n2<-input$n2
    c2<-input$c2
    d2<-input$d2
    p2<-seq(input$p2[1],input$p2[2],by=input$r2)
    n_p=length(p2)
    x1=((c1+1):(d1-1))
    n_x1=length(x1)
    
    Pa1=pbinom(c1,n1,p2)
    Pa_2<-matrix(ncol = n_x1,nrow = n_p)
    for (j in 1:n_p) {
      for (i in 1:n_x1) {
        Pa_2[j,i]=dbinom(x1[i],n1,p2[j])*pbinom(c2-x1[i],n2,p2[j])
      }
    }
    Pa2=rowSums(Pa_2)
    Pa_=rowSums(data.frame(Pa1,Pa2))
    
    AOQ2=p2*(Pa1*(N2-n1)+Pa2*(N2-n1-n2))/N2
    ATI2=Pa1*n1+Pa2*(n1+n2)+(1-Pa_)*N2
    
    Pa1=data.frame("Proportion"=p2,"Prob"=Pa1,"Typ"="Pa1")
    Pa2=data.frame("Proportion"=p2,"Prob"=Pa2,"Typ"="Pa2")
    Pa_=data.frame("Proportion"=p2,"Prob"=Pa_,"Typ"="Pa")
    AOQ2=data.frame("Proportion"=p2,"Prob"=AOQ2,"Typ"="AOQ")
    ATI2=data.frame("Proportion"=p2,"Prob"=ATI2,"Typ"="ATI")

    dat=rbind(Pa1,Pa2,Pa_,AOQ2,ATI2)
    
    if(input$curve2==1){
      ggplot(Pa_, aes(x=Proportion, y=Prob))+
        theme_minimal()+
        geom_line()+
        geom_point()
      
    }
    else if (input$curve2==2){
      ggplot(Pa1, aes(x=Proportion, y=Prob))+
        theme_minimal()+
        geom_line()+
        geom_point()
    }
    else if (input$curve2==3){
      ggplot(Pa2, aes(x=Proportion, y=Prob))+
        theme_minimal()+
        geom_line()+
        geom_point()
    }
    else if (input$curve2==4){
      ggplot(AOQ2, aes(x=Proportion, y=Prob))+
        theme_minimal()+
        geom_line()+
        geom_point()
    }
    else {
      ggplot(ATI2, aes(x=Proportion, y=Prob))+
        theme_minimal()+
        geom_line()+
        geom_point()
    }
  })
  output$stat2<-renderPrint({
    N2<-input$N2
    n1<-input$n1
    c1<-input$c1
    d1<-input$d1
    n2<-input$n2
    c2<-input$c2
    d2<-input$d2
    p2<-seq(input$p2[1],input$p2[2],by=input$r2)
    n_p=length(p2)
    x1=((c1+1):(d1-1))
    n_x1=length(x1)
    
    Pa1=pbinom(c1,n1,p2)
    Pa_2<-matrix(ncol = n_x1,nrow = n_p)
    for (j in 1:n_p) {
      for (i in 1:n_x1) {
        Pa_2[j,i]=dbinom(x1[i],n1,p2[j])*pbinom(c2-x1[i],n2,p2[j])
      }
    }
    Pa2=rowSums(Pa_2)
    Pa_=rowSums(data.frame(Pa1,Pa2))
    
    AOQ2=p2*(Pa1*(N2-n1)+Pa2*(N2-n1-n2))/N2
    ATI2=Pa1*n1+Pa2*(n1+n2)+(1-Pa_)*N2
    
    tb2=data.frame(p2,Pa_,Pa1,Pa2,AOQ2,ATI2)
    summary(tb2)
  })
  output$tbl2<-renderTable({
    N2<-input$N2
    n1<-input$n1
    c1<-input$c1
    d1<-input$d1
    n2<-input$n2
    c2<-input$c2
    d2<-input$d2
    p2<-seq(input$p2[1],input$p2[2],by=input$r2)
    n_p=length(p2)
    x1=((c1+1):(d1-1))
    n_x1=length(x1)
    
    Pa1=pbinom(c1,n1,p2)
    Pa_2<-matrix(ncol = n_x1,nrow = n_p)
    for (j in 1:n_p) {
      for (i in 1:n_x1) {
        Pa_2[j,i]=dbinom(x1[i],n1,p2[j])*pbinom(c2-x1[i],n2,p2[j])
      }
    }
    Pa2=rowSums(Pa_2)
    Pa_=rowSums(data.frame(Pa1,Pa2))
    
    AOQ2=p2*(Pa1*(N2-n1)+Pa2*(N2-n1-n2))/N2
    ATI2=Pa1*n1+Pa2*(n1+n2)+(1-Pa_)*N2
    
    tb2=data.frame("No"=(1:n_p),"p"=p2,"Pa"=Pa_,Pa1,Pa2,"AOQ"=AOQ2,"ATI"=ATI2)
    tb2
  })
}

shinyApp(ui,server)
