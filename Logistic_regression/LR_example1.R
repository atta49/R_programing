####################################################
############ Logistic Regression ##################
####################################################

mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata)

mydata$rank <- factor(mydata$rank)
#split into train test data
set.seed(40)
require(caTools)
samplesplit<-sample.split(Y=mydata$admit,SplitRatio = 0.8)
trainset<-subset(mydata,X=mydata,samplesplit==TRUE)
testnset<-subset(mydata,X=mydata,samplesplit==FALSE)
     
     
mylogit <- glm(admit ~ gre + gpa + rank, data = trainset, family = "binomial")
summary(mylogit)

predicted_data <- predict.glm(mylogit,testnset)
par(mfrow=c(1, 1))
plot(trainset$admit,type="p",col="red",main="Admit Prediction",ylab="Admit Value")
abline(h=0.5, col="black")
points(predicted_data,type="p",col="green")
legend("topright", inset=.0005,  c("Actual","Prediction"),lwd=2, lty=c(1, 1, 1, 1, 2), col=c("red","green"))


#And now we can evaluate. We’ll create a 
#dataframe of actual and predicted values, for starters:

modeleval<-cbind(testnset$admit,predicted_data)
colnames(modeleval)<-c("actual","predicted")
modeleval<-as.data.frame(modeleval)
View(modeleval)



imp
library(caret)
imp <- varImp(mylogit)
bp <- barplot(imp[,1],xlab="Importance",ylab="Data Variables",
              main="Variable Importance from Regression Model",col=heat.colors(7),horiz=TRUE, xlim=range(0,10))
a <- imp[,1]
names <- rownames(imp)
text(a, bp, names, pos=4,cex=0.6)
