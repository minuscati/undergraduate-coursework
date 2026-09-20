library(readxl)
d<-read_excel("D:/新建文件夹 (5)/大三/多元统计/数据/聚类分析数据.xls",5)
rn<-d$地区
df<-d[,-1]
df<-scale(x=df)
df<-na.omit(df)
row.names(df)<-rn
dis<-dist(df,method="euclidean")

library(tidyverse)
library(cluster)
library(factoextra)
fviz_dist(dis,gradient=list(low='white',high='red'))
wss<-function(k){
  kmeans(df,k,nstart=10)$tot.withinss
}
k.values<-1:30
wss_value<-map_dbl(k.values,wss)
plot(k.values,wss_value,
     type='b',pch=19,frame=FALSE,
     xlab="Number of K",
     ylab="Total within-clusters of squares")

k2<-kmeans(df,centers=3,nstart=10)
fviz_cluster(k2,data=df)