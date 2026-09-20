library(readxl)
d<-read_excel("D:/新建文件夹 (5)/大三/多元统计/聚类分析数据.xls",1)
rn<-d$公司
df<-d[,-1]
df<-scale(x=df)
dis<-dist(df,method="euclidean")
result<-hclust(d=dis,method="centroid")
plot(result,labels=rn)
result$merge

library(tidyverse)
library(cluster)
install.packages("factoextra")
library(factoextra)
fviz_dist(dis,gradient=list(low='white',high='red'))
wss<-function(k){
  kmeans(df,k,nstart=10)$tot.withinss
}
k.values<-1:14
wss_value<-map_dbl(k.values,wss)
plot(k.values,wss_value,
     type='b',pch=19,frame=FALSE,
     xlab="Number of K",
     ylab="Total within-clusters of squares")

k2<-kmeans(df,centers=2,nstart=10)
fviz_cluster(k2,data=df)