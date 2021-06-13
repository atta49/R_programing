x<-datasets::airquality
airquality
View(x)

is.na(x)
is.na(x$Ozone)

which(is.na(x$Ozone))
sum(is.na(x$Ozone))
colSums(is.na(x))

x$Ozone[is.na(x$Ozone)]<-mean(x$Ozone, na.rm = TRUE)
x$Ozone=round(x$Ozone,2)

x$Solar.R[is.na(x$Solar.R)]<-median(x$Solar.R,na.rm = TRUE)

#complete.cases() return false if any row index contain NA value
complete.cases(airquality)
#return the row which doest not contain NA values
airquality[complete.cases(airquality),]
na.omit(airquality)
#return the row which contain NA values
contain=airquality[!complete.cases(airquality),]
contain