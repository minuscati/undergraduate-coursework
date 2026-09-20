library(readxl)
library(MASS)
library(tidyverse)
d<-read_excel("D:/新建文件夹 (5)/大三/多元统计/EX4.9.xlsx",1)
names(d)<-c('credit', 'number','X1','X2','X3','X4','X5','X6','X7','X8')
d$credit<-as.factor(d$credit)
model<-lda(credit~X1+X2+X3+X4+X5+X6+X7+X8,d)
model
#attributes(model)
model.predict<-predict(model,data=d)
d$number
newd<-data.frame(X1=53,X2=1,X3=9,X4=18,X5=50,X6=11.2,X7=2.02,X8=3.58)
newd.predict<-predict(model,newd)
newd.predict$class