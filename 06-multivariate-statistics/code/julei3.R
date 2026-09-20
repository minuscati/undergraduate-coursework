library(readxl)
library(tidyverse)
library(ggcorrplot)
Sys.setlocale(category="LC_ALL",locale="zh_CN.UTF-8")
d<-read_excel("D:/新建文件夹 (5)/大三/多元统计/数据/聚类分析数据.xls",5)
#nms<-d$法人单位数.个.
nms<-d[1,]
# 提取每行的第一个汉字
first_characters <- substr(nms[3:14], 1, 2)
d<-d[,-3]
d<-data.frame(d)
options(digits = 2)
da<-na.omit(d)
da<-da[,-1]
dat<-da[,-2]
dat=as.data.frame(lapply(dat,as.numeric))
names(dat)<-c(first_characters)
cor_df<-cor(dat[2:11])
ggcorrplot(cor_df,type = "lower", lab = TRUE)
threshold <- 0.9

# 使用which和arr.ind参数找到满足条件的相关性项的位置
high_cor_indices <- which(cor_df > threshold & cor_df<1, arr.ind = TRUE)

# 获取相关性大于阈值的项
high_cor_pairs <- data.frame(
  Variable1 = rownames(cor_df)[high_cor_indices[, 1]],
  Variable2 = colnames(cor_df)[high_cor_indices[, 2]],
  Correlation = cor_df[high_cor_indices]
)

# 打印结果
print(high_cor_pairs)