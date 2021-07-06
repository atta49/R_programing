library(dplyr)
install.packages("ggplot2")
library(ggplot2)
df<-read.csv("Fish.csv")
df
summary(df)

length(is.na(df))
any(is.na(df))
sum(is.na(df))

ggplot(df,aes(x=Weight, y=Height))+ 
     geom_point(aes(color=Species, size=10,alpha=0.7))
#+     stat_smooth(method = "lm",color = "red",se = FALSE)
       
library(corrplot)              
#only defined on a data frame with all numeric variables
corrplot(df,method = "circle") 

#install.packages("corrgram")
library(corrgram)
corrgram(df,lower.panel = panel.shade,upper.panel = panel.cor)

#install.packages("caTools")
library(caTools)
set.seed(42)
samplesplit<-sample.split(Y=df$Weight,SplitRatio = 0.7)
samplesplit
trainset<-subset(df,X=df, samplesplit==TRUE)
testset<-subset(df,X=df, samplesplit==FALSE)
length(trainset)
length(testset)
head(trainset)
#model bulilding
#model <- lm(target ~ var_1 + var_2 + ... + var_n, data=train_set)
#model <- lm(target ~. , data=train_set)
#model <- lm(formula=Weight ~ ., data=trainSet)

model<-lm(Weight ~. , data = trainset)
summary(model)

modelResiduals <- as.data.frame(residuals(model)) 
View(modelResiduals)
ggplot(modelResiduals, aes(residuals(model))) +
     geom_histogram(fill='deepskyblue', color='black')

preds<-predict(model,testset)
preds

#And now we can evaluate. We’ll create a 
#dataframe of actual and predicted values, for starters:
modelEval <- cbind(testset$Weight, preds)
colnames(modelEval) <- c('Actual', 'Predicted')
modelEval <- as.data.frame(modelEval)
View(modelEval)


mse <- mean((modelEval$Actual - modelEval$Predicted)^2)
mse
rmse <- sqrt(mse)
rmse
