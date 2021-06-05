x<-Sys.time()
x
p<-as.POSIXlt(x)
p
class(p)
unclass(p)
names(unclass(p))
as.POSIXct(x)

datestring<-c("January 10, 2018 11:36","June 3, 2021 11:40")
x<-strptime(datestring,"%B %d, %Y %H:%M")
x

x<-as.Date("2020-01-01")
y<-strptime("9 jan 2019 11:41:45","%d %b %Y %H:%M:%S")
x-y
class(x)
class(y)
x<-as.POSIXlt(x)
x-y


x<-as.POSIXct("2020-01-01 01:00:00")
y<-as.POSIXct("2020-01-01 05:00:00",tz="gmt")
x-y
x
y
