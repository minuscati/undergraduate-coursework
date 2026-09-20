library(MASS)
library(readxl)
library(tidyverse)
library(ggplot2)
iris <- read_excel("D:/新建文件夹 (5)/大三/多元统计/iris数据.xls",1)
model<-lda(Species~.,iris)
model
attributes(model)

model.predict<-predict(model,data=iris)
iris$LD1<-model.predict$x[,1]
iris$LD2<-model.predict$x[,2]
newcase<-data.frame(
  Sepal.length=c(7.2,5.5,5.4,5.1,5,6.7),
  Sepal.width=c(3.6,2.5,3.9,2.5,3.2,3.1),
  Petal.length=c(6.1,4,1.3,3,1.2,5.6),
  Petal.width=c(2.5,1.3,0.4,1.1,0.2,2.4)
)
newcase.predict<-predict(model,newcase)
newcase.predict
newcase$Species<-newcase.predict$class
newcase$LD1<-newcase.predict$x[,1]
newcase$LD2<-newcase.predict$x[,2]
iris %>% ggplot(aes(LD1,LD2,col=Species))+geom_point()+
  geom_point(data=newcase,aes(LD1,LD2),
             col='yellow',
             size=1.5)