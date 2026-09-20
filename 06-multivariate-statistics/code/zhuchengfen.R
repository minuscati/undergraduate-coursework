install.packages('psych')
library(psych)
library(tidyverse)
library(readxl)
d<-read_excel("D:/新建文件夹 (5)/大三/多元统计/数据/主成分分析上机实验数据.xls",1)

nms<-d$城市

da<-d[,-1]
da<-data.frame(da)
da<-scale(da)


fa.parallel(da,fa='pc')
p<-principal(da,nfactors = 2,rotate='none')
p$values
sum(p$values[1:2])/sum(p$values)

cor_da<-cor(da)
library(ggcorrplot)
ggcorrplot(cor_da,type = "lower", lab = TRUE)
A<-data.frame(cor_da)
write.csv (A, file ="D:/新建文件夹 (5)/大三/多元统计/数据/A.csv")
B<-data.frame(p$loadings)
write.csv (B, file ="D:/新建文件夹 (5)/大三/多元统计/数据/B.csv")
C<-data.frame(p$scores)
write.csv (C, file ="D:/新建文件夹 (5)/大三/多元统计/数据/C.csv")
 
w1=p$values[1]/(p$values[1]+p$values[2])
w2=p$values[2]/(p$values[1]+p$values[2])
  caculate_score<-function(p,m){
  comp_score_matrix<-p$scores #各主成分得分矩阵
  comp_score<-data.frame(comp_score_matrix)
  comp_score_f<-as.numeric(w1*p$scores[,1]+w2*p$scores[,2])
  comp_score$rank<-rank(-comp_score_f)
  return(comp_score_f)}
  score<-caculate_score(p,2)
  score<-data.frame(score)
  rownames(score)<-nms
  write_excel_csv(score, file ="D:/新建文件夹 (5)/大三/多元统计/数据/score1.csv")

  