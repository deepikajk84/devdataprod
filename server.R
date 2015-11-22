library(shiny)
library(pgmm)
library(caret)
library(e1071)
data("coffee")
data<-coffee
shinyServer(function(input, output){
        model<-reactive({
                lm(Variety~Fat+Caffine, data=data)
})

fitted<-reactive({

        round(predict(model(),data.frame(Fat=input$fat, Caffine=input$caffine)),0)
})
output$fittedValue<-renderPrint({
        if(fitted()==1) "Arabica" else "Robusta"
})
output$modsummary<-renderPrint({
        summary(model())
})
output$confM<-renderPrint({
        confusionMatrix(round(model()$fitted.values,0),coffee$Variety)
})
output$Plot1<-renderPlot({
        boxplot(Caffine~Variety, data=data, col="green",main="Caffine~Variety",names=c("Arabica","Robusta"))
})
output$Plot2<-renderPlot({
        boxplot(Fat~Variety, data=data, col="orange", main="Fat~Variety",names=c("Arabica","Robusta"))
})
})
