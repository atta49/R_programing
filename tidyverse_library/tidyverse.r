install.packages("tidyverse")
head(msleep.csv)
getwd()
setwd("../")
setwd("./tidyverse_library")
msleep<-read.csv("msleep.csv")
head(msleep)
View(msleep)
sleep_time<-select(msleep,name,sleep_total)
sleep_time