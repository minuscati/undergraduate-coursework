library(readxl)
library(aTSA)
library(tseries)
library(forecast)
library(psych)
library(tidyverse)
library(stats)
library(ggcorrplot)
install.packages('aTSA')
library('aTSA')
#读数据，计算相关性
d<-read_excel("D:/新建文件夹 (5)/大三/时间序列分析/期末作业/分省年度数据.xls",2)
x=d[,3:14] # 自变量
y=d[,2] # 因变量
x1<-as.matrix(x)
y1<-as.matrix(y)
x1t<-as.matrix(d[,15])
cor_da<-data.frame(cor(x))
#write_excel_csv(cor_da, file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/COR.csv")
ggcorrplot(cor_da,type = "lower", lab = TRUE)


#lasso回归 选取主要影响因素
library(lars)
library(psych)
library(tidyverse)
library(readxl)
y_1<-y1+rnorm(30)
lasso_model <- lars(x1, y_1, type = "lasso")
coef(lasso_model)
coef=coef.lars(lasso_model,mode="step",s=34) 
COEF<-data.frame(coef[coef!=0])

#画原序列图，处理数据实现差分平稳
Fir_ind<-ts(x1[,1],start=1993)
Sec_ind<-ts(x1[,2],start=1993)
Thir_ind<-ts(x1[,3],start=1993)
X<-data.frame(Fir_ind,Sec_ind,Thir_ind)
GDP<-ts(y1[,1],start=1993)
X1t<-ts(x1t[,1],start=1993)
plot(GDP,type="o",pch=1,col='black',xlab='TIME',ylab='GDP',main="江苏省1993-2023年地区生产总值时序图")
plot(Fir_ind,type='o',pch=8,col='blue',ylim=range(0,60000))
lines(Sec_ind,type='o',pch=17,col='green')
lines(Thir_ind,type='o',pch=20,col='red')
legend('topleft',lty=c(1,1,1),col=c('blue','green','red'),
       legend=c('Fir_ind','Sec_ind','Thir_ind')) 
Ln_GDP=log(GDP)
Ln_F_I=log(Fir_ind)
Ln_S_I=log(Sec_ind)
Ln_T_I=log(Thir_ind)
plot(Ln_GDP,type='o',pch=8,col='black',xlab='TIME',ylab='LN_GDP ',main="江苏省1993-2023年地区生产总值对数时序图")
   #  ylim=range(6,12))
lines(Ln_F_I,type='o',pch=8,col='blue')
lines(Ln_S_I,type='o',pch=17,col='green')
lines(Ln_T_I,type='o',pch=20,col='red')
legend('topleft',lty=c(1,1,1,1),col=c('black','blue','green','red'),
       legend=c('GDP','Fir_ind','Sec_ind','Thir_ind')) 
DIF_GDP=diff(Ln_GDP,1)
DIF_F_I=diff(Ln_F_I,1)
DIF_S_I=diff(Ln_S_I,1)
DIF_T_I=diff(Ln_T_I,1)
plot(DIF_GDP,type='o',pch=20,col='black',xlab='TIME',ylab='DIF_LN_GDP ',main="一阶差分后江苏省1993-2023年地区生产总值对数时序图")
plot(DIF_F_I,type='o',pch=8,col='blue')
plot(DIF_S_I,type='o',pch=17,col='green')
plot(DIF_T_I,type='o',pch=20,col='red')
legend('topleft',lty=c(1,1,1,1),col=c('black','blue','green','red'),
       legend=c('GDP','Fir_ind','Sec_ind','Thir_ind')) 
acf(DIF_GDP)
pacf(DIF_GDP)
install.packages('aTSA')
library('aTSA')
adf.test(DIF_GDP)
adf.test(DIF_F_I)
adf.test(DIF_S_I)
adf.test(DIF_T_I)
for (i in 1:2) 
  print(Box.test(DIF_GDP,lag=6*i))
for (i in 1:2) 
  print(Box.test(DIF_F_I,lag=6*i))
for (i in 1:2) 
  print(Box.test(DIF_S_I,lag=6*i))
for (i in 1:2) 
  print(Box.test(DIF_T_I,lag=6*i))

#响应序列一元模型 平稳纯随机 建模检验
acf(DIF_GDP)
pacf(DIF_GDP)
acf(y_tr)
pacf(y_tr)
y_tr<-window(Ln_GDP,start=1993,end=2017)
#ARIMA
y_fit1<-Arima(y_tr,order=c(1,1,0),include.drift = T)
y_fit1

tsdiag(y_fit1)
t=abs(y_fit1$coef)/sqrt(diag(y_fit1$var.coef))
pt(t,length(y_tr-1)-length(y_fit1$coef),lower.tail = F)
#arima
y_fit2<-arima(y_tr,order=c(1,1,0))
y_fit2
ts.diag(y_fit2)
t=abs(y_fit2$coef)/sqrt(diag(y_fit2$var.coef))
pt(t,length(y_tr-1)-length(y_fit2$coef),lower.tail = F)

fore1<-forecast(y_fit1,h=5)
plot(fore1)
lines(fore1$fitted,col=2,lty=2)
test<-window(Ln_GDP,start=2018)
error1<-test-fore1$mean
file1<-data.frame(fore1$mean,test,error1)
file1
mean(error1)
write_excel_csv(file1, file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/file1.csv")
fore2<-forecast(y_fit2,h=5)
plot(fore2)
lines(fore2$fitted,col=2,lty=2)
error2<-test-fore2$mean
file2<-data.frame(fore2$mean,test,error2)
file2
mean(error2)
write_excel_csv(file2, file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/file2.csv")
y_fit22<-arima(Ln_GDP,order=c(1,1,0))
y_fit22
fore21<-forecast(y_fit2,h=10)
fore22_<-predict(y_fit22,n.ahead = 5)$pred
ts.diag(y_fit22)
plot(fore21)
write_excel_csv(data.frame(fore22), file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/fore22.csv")
plot(fore22)
lines(fore22$fitted,col=2,lty=2)

#自变量预测
acf(DIF_F_I)
pacf(DIF_F_I)
adf.test(DIF_F_I)
acf(DIF_S_I)
pacf(DIF_S_I)
adf.test(DIF_S_I)
acf(DIF_T_I)
pacf(DIF_T_I)
adf.test(DIF_T_I)

x1_fit<-Arima(Ln_F_I,order=c(1,1,1),include.drift = T)
x1_fit<-arima(Ln_F_I,order=c(1,1,1),transform.pars=F)
x1_fit
ts.diag(x1_fit)
x1_pre<-forecast(x1_fit,h=5)
x1_pre$mean
x2_fit<-arima(Ln_S_I,order=c(1,1,0),transform.pars=F)
x2_fit
ts.diag(x2_fit)
x2_pre<-predict(x2_fit,n.ahead = 5)$pred
x2_pre
auto.arima(Ln_F_I)
x3_fit<-arima(Ln_T_I,order=c(1,1,0),transform.pars=F)
x3_fit
ts.diag(x3_fit)
x3_pre<-predict(x3_fit,n.ahead = 5)$pred
x3_pre
for (i in 1:2) 
  print(Box.test(x1_fit$residuals,lag=6*i))
for (i in 1:2) 
  print(Box.test(x2_fit$residuals,lag=6*i))
for (i in 1:2) 
  print(Box.test(x3_fit$residuals,lag=6*i))
FOREX<-data.frame(x1_pre$mean,x2_pre,x3_pre)
write_excel_csv(FOREX, file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/FOREX.csv")
#多元时序 协整
plot(Ln_GDP,col='black',lwd=2,main="多元时序图")
lines(Ln_F_I,pch=22,col='brown',lty=2,lwd=2)
lines(Ln_S_I,pch=22,col='red',lty=2,lwd=2)
lines(Ln_T_I,pch=22,col='blue',lty=2,lwd=2)
legend("topleft",cex=0.6,lty=2,lwd=2,col=c('black','brown','red','blue'),
       legend=c('Ln_GDP','Ln_F_I','Ln_S_I','Ln_T_I')) 
ccf(Ln_GDP,Ln_F_I)
ccf(Ln_GDP,Ln_S_I)
ccf(Ln_GDP,Ln_T_I)
y_fit3<-arima(Ln_GDP,xreg =data.matrix(Ln_S_I,Ln_T_I),include.mean = F)
y_fit3

adf.test(y_fit3$residuals)
Box.test(y_fit3$residuals,lag=6,type = "Ljung-Box")
acf(y_fit3$residuals)
pacf(y_fit3$residuals)
auto.arima(y_fit3$residuals)
y_fit32<-arima(Ln_GDP,order=c(2,0,0),xreg =data.matrix(Ln_S_I,Ln_T_I),include.mean = F)
y_estimate<-fitted(y_fit32)
y_fit32#选这个
Box.test(y_fit32$residuals,lag=6,type = "Ljung-Box")
ts.diag(y_fit32)

y_pre<-predict(y_fit32,newxreg=as.matrix(x2_pre,x3_pre),n.ahead = 5)
y_pre
y_fore<-exp(y_pre$pred)
l95<-y_pre$pred-1.96*y_pre$se
u95<-y_pre$pred+1.96*y_pre$se
par(mar = c(5, 5, 4, 2) + 0.1)  
par(cex.lab = 1.2, cex.axis = 1.2)
par(las = 1)
plot(Ln_GDP, xlim = c(1993, 2027), ylim = c(8, 12.5), lwd = 2, col = "black", main = "协整回归动态模型拟合与预测")
lines(y_estimate, col = 2, lty = 2, lwd = 2)
lines(y_pre$pred, col = 2, lty = 2, lwd = 2)
lines(l95, col = "blue", lty = 2, lwd = 2)
lines(u95, col = "blue", lty = 2, lwd = 2)
legend("topleft", legend = c("观测值", "拟合值", "预测值", "置信区间"),
       col = c("black", 2, 2, "blue"),
       lty = c(1, 2, 2, 2),
       lwd = c(2, 2, 2, 2),
       cex = 0.7)

FOREY_X<-data.frame(y_pre$pred,l95,u95,exp(y_pre$pred))
write_excel_csv(FOREY_X, file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/FOREY_X.csv")

#ECM
DX<-ts(data.frame(DIF_F_I,DIF_S_I,DIF_T_I))
library(aTSA)
ECM<-ecm(DIF_GDP,DX)
write_excel_csv(data.frame(ECM$coefficients), file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/ECM.csv")
#随机森林
install.packages('randomForest')
install.packages('varSelRF')
install.packages('pROC')
library(randomForest)
library(varSelRF)
library(pROC)
#按index拆分训练集与测试集
index <- sample(2,nrow(d),replace = TRUE,prob=c(0.78,0.22))
traindata <- d[index==1,]
testdata <- d[index==2,]
X_t<-data.frame(log(traindata[3:5]))
Y_t<-data.frame(log(traindata[2]))
X_te<-data.frame(log(testdata[3:5]))
Y_te<-data.frame(log(testdata[2]))
#试验性训练模型
test_model <- randomForest(x = X_t[,1:3], y = Y_t[,1])
new_observation <- X_te[,1:3]
prediction <- predict(test_model, newdata = new_observation)
rf_erorr<-prediction-Y_te[,1]
FINAL<-data.frame(prediction,Y_te[,1],rf_erorr)
write_excel_csv(data.frame(FINAL), file ="D:/新建文件夹 (5)/大三/时间序列分析/期末作业/数据/FINAL.csv")

NEWD<-XSUM[31:35,2:3]
colnames(NEWD)<-colnames(X_t)
prediction1<-predict(test_model, newdata = NEWD)


auto.arima(XXX)
XXX<-data.frame(Ln_F_I,Ln_S_I,Ln_T_I)
#到这就好了 不一定要预测
#最终建模
XSUM1<-c(Ln_F_I, x1_pre$mean)
XSUM2<-c(Ln_S_I, x2_pre)
XSUM3<-c(Ln_T_I, x3_pre)
XSUM<-data.frame(XSUM1,XSUM2,XSUM3)
Y_t<-as.matrix(Ln_GDP)
FINAL_model1 <- randomForest(x = XSUM[1:30,1:3], y = Y_t[,1])
NEWDATA1<-XSUM[31,1:3]
Fpre1 <- predict(FINAL_model1, newdata = NEWDATA1)

Y_t1<-rbind(Y_t,Fpre1)
FINAL_model2 <- randomForest(x = XSUM[1:31,1:3], y = Y_t1[,1])
NEWDATA2<-XSUM[32,1:3]
Fpre2 <- predict(FINAL_model2, newdata = NEWDATA2)

Y_t2<-rbind(Y_t1,Fpre2)
FINAL_model3 <- randomForest(x = XSUM[1:32,1:3], y = Y_t2[,1])
NEWDATA3<-XSUM[33,1:3]
Fpre3 <- predict(FINAL_model3, newdata = NEWDATA3)

Y_t3<-rbind(Y_t2,Fpre3)
FINAL_model4 <- randomForest(x = XSUM[1:33,1:3], y = Y_t3[,1])
NEWDATA4<-XSUM[34,1:3]
Fpre4 <- predict(FINAL_model4, newdata = NEWDATA4)

Y_t4<-rbind(Y_t3,Fpre4)
FINAL_model5 <- randomForest(x = XSUM[1:34,1:3], y = Y_t4[,1])
NEWDATA5<-XSUM[35,1:3]
Fpre5 <- predict(FINAL_model5, newdata = NEWDATA5)
Fpre<-as.matrix(Fpre1,Fpre2,Fpre3,Fpre4,Fpre5)
Fpre# 使用训练好的模型进行未来数据的预测
plot(Fpre)

#协整检验+因果检验
install.packages("lmtest")
library(lmtest)
GF.reg = lm(Ln_GDP~Ln_F_I)
error = residuals(GF.reg)
plot(error,main = "Ln_GDP--Ln_F_I")
adf.test(error)
summary(GF.reg)

GS.reg = lm(Ln_GDP~Ln_S_I)
error2 = residuals(GS.reg)
plot(error,main = "Ln_GDP--Ln_S_I")
adf.test(error2)
summary(GS.reg)

GT.reg = lm(Ln_GDP~Ln_T_I)
error3 = residuals(GT.reg)
plot(error3,main = "Ln_GDP--Ln_T_I")
adf.test(error2)
summary(GT.reg)

acf(DIF_GDP)
grangertest(Ln_GDP~Ln_F_I,order=1)
grangertest(Ln_F_I~Ln_GDP,order=1)#FI是GDP变化原因
grangertest(Ln_GDP~Ln_S_I,order=1)#
grangertest(Ln_S_I~Ln_GDP,order=1)#SI是GDP的因
grangertest(Ln_GDP~Ln_T_I,order=1)#
grangertest(Ln_T_I~Ln_GDP,order=1)#TI是GDP的因
#干预分析
ccf(GDP,X1t)
library(TSA)
y_fit4<-arimax(DIF_GDP,xreg =data.frame(DIF_F_I,DIF_S_I,DIF_T_I),include.mean=F)
y_fit4
acf(y_fit4$residuals)
pacf(y_fit4$residuals)
for (i in 1:2) 
  print(Box.test(y_fit4$residuals,lag=6*i))