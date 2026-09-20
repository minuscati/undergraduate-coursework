library(readxl)
library(tidyverse)
data <- read_excel("D:/新建文件夹 (5)/大三/多元统计/习题3.5数据.xlsx",1)
data<-data[,-1]
sapply(data,mean)
cor(data)
Standard_d<-scale(data,center = T,scale = T) 
Covariance_SX = cov(Standard_d)
cov(data[,1],data[,2])
