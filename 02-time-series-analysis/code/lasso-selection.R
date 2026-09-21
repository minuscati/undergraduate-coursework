library(psych)
library(tidyverse)
library(readxl)
y_1<-y1+rnorm(30)
lasso_model <- lars(x1, y_1, type = "lasso")
coef(lasso_model)
coef=coef.lars(lasso_model,mode="step",s=34) 
COEF<-data.frame(coef[coef!=0]) # 获取系数值不为零的自变量对应的系数值
#write_excel_csv(COEF, file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/COEF.csv")
