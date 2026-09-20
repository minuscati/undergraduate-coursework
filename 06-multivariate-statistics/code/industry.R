install.packages("tidyverse")
install.packages("ggcorrplot")
library(tidyverse)
library(ggcorrplot)
Sys.setlocale(category="LC_ALL",locale="zh_CN.UTF-8")
d <- read_csv("E:/R_data/多元统计上机实验二经济数据.csv")
nms<-d["地区"]
d<-d[,-1]
d<-data.frame(d)
options(digits = 2)
summary(d)
sapply(d, mean)
cov(d)
cor(d)
Standard_d<-scale(d,center = T,scale = T)
Covariance_SX = round(cov(Standard_d),2)
Dim_d=dim(d)
Scatter_d = (Dim_d[1]-1)*cov(d)
ggcorrplot(Covariance_SX, type = "lower", lab = TRUE)


