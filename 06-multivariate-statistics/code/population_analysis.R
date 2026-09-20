install.packages('fmsb')
library(fmsb)
install.packages('GGally')
install.packages("readxl")
library(readxl)
T<-read_excel("E:/duoyuantongji_data/Population.xlsx",1)
#d<-T[c('North','North-east','East','Central-south','South-west','North-west'),c('Young','Adult','Old')]
library(GGally)
data <-T[
  Region = c('North','North-east','East','Central-south','South-west','North-west'),
  Youth = c('Young'),
  Adult = c('Adult'),
  Elderly = c('Old')]
ggplot(data, aes(x = Region, y = Youth)) +
  geom_point(size = 3, color = "blue") +
  labs(title = "青年型人口数量", x = "地区", y = "人口数量")