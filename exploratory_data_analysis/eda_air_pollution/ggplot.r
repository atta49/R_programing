install.packages("ggplot2")
library(ggplot2)
str(mpg)
#scatter plot
qplot(displ,hwy,data=mpg)
#mofiying asthetic
qplot(displ,hwy,data=mpg,color=manufacturer)
#adding geometric
qplot(displ,hwy,data=mpg,geom = c("point","smooth"))
#histogram
qplot(hwy,data = mpg, fill=drv)
#facets scatterplot
qplot(displ, hwy, data = mpg, facets = . ~ drv)
#variation
qplot(displ, hwy, data = mpg, facets = drv ~ .)
qplot(displ, hwy, data = mpg, facets = drv ~ fl)
qplot(displ, hwy, data = mpg, facets = fl ~ drv)
#facets histogram
qplot(hwy,data=mpg,facets = drv ~ .,binwidth=2)
qplot(hwy,data=mpg,facets = drv ~ fl,binwidth=2)

str(maacs)
qplot(log(eno),data = maacs)
qplot(log(eno),data = maacs,fill= mopos)
qplot(log(eno),data = maacs,geom = "density")
qplot(log(eno),data = maacs,geom = "density", color=mopos,fill=mopos)

#scatter plot eno vs pm25 
qplot(log(pm25),log(eno),data = maacs,shape=mopos)
qplot(log(pm25),log(eno),data = maacs,color=mopos)
qplot(log(pm25),log(eno),data = maacs,color=mopos,geom =c("point","smooth"),method='lm')
qplot(log(pm25),log(eno),data = maacs,geom =c("point","smooth"),method='lm',facets = . ~ mopos)

getwd()
setwd('./Documents/R_repo/R_programing/exploratory_data_analysis/eda_air_pollution')
maacs_2<-read.csv("bmi_pm25_no2_sim.csv",header = TRUE)
maacs_2 
qplot(logpm25,NocturnalSympt,data = maacs_2,facets = .~bmicat,geom = c("point","smooth"),method='lm')
g<-ggplot(maacs_2,aes(logpm25,NocturnalSympt))
summary(g)
print(g)
g+geom_point()
g+geom_point()+geom_smooth()
g+geom_point()+geom_smooth(method = 'lm')
g+geom_point() +facet_grid(.~bmicat)+geom_smooth(method = 'lm')

#annotation
g+geom_point(color='steelblue')
g+geom_point(color='steelblue',size=4)
g+geom_point(color='steelblue',size=4,alpha=1/2)

#annotation for catgorical variable
g+geom_point(aes(color=bmicat))
g+geom_point(aes(color=bmicat),size=4,alpha=1/2)
 
#modifying label
g+geom_point(aes(color=bmicat))+labs(title = "maacs cohort")
g+geom_point(aes(color=bmicat))+labs(title = "maacs cohort")+
     labs(x=expression('log'*PM[2.5]),y="Noctural symptoms")

#customizing the smooth
g+geom_point(aes(color=bmicat))+labs(title = "maacs cohort")+
     geom_smooth(size=3,linetype=2,method = 'lm',se = FALSE) #se show gray shaded area bydefault true

#changing theme
g+geom_point(aes(color=bmicat))+labs(title = "maacs cohort")+
     theme_bw(base_family = "Times")

#axis limit
testdata<-data.frame(x=1:100,y<-rnorm(100))
testdata
testdata[50,2]<-100
plot(testdata$x,testdata$y,type = 'l',ylim = c(-3,3))

#using ggplot
g<-ggplot(testdata, aes(x=x,y=y))
g+ geom_line()
g+ geom_line()+ ylim(-3, 3)
g+ geom_line()+ coord_cartesian(ylim= c(-3, 3))

#complex
cutpoints<-quantile(maacs_2$logno2_new,seq(0,1,length=4),na.rm = TRUE)
cutpoints
maacs_2$no2tert<-cut(maacs_2$logno2_new,cutpoints)
maacs_2$no2tert
levels(maacs_2$no2tert)
g<-ggplot(maacs_2,aes(logpm25,NocturnalSympt))
g+geom_point(alpha=1/2)+
facet_wrap(bmicat ~ no2tert,nrow = 2,ncol = 4)+
geom_smooth(method = 'lm',se=FALSE,col='steelblue')+
theme_bw(base_family = "avenir",base_size = 10)+
labs(x=expression('log'*PM[2.5]))+
labs(y="Noctural Symptoms")+
labs(title="Maacs Cohort")