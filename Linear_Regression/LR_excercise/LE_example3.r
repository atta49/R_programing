summary(income.data)
hist(income.data$happiness)
View(income.data)
income.data
plot(happiness ~ income, data = income.data)
income.happiness.lm <- lm(happiness ~ income, data = income.data)
summary(income.happiness.lm)
#model prediction
a<-data.frame(income=10.23567)
r<-predict(income.happiness.lm,a)
r
#visualization
#plot(happiness,income,col = "blue",main = "Height & Weight Regression",
#     abline(lm(happiness~income, data = income.data)),xlab = "income",ylab = "happiness")

plot(happiness ~ income, data = income.data)
abline(income.happiness.lm) 

plot(income.happiness.lm$residuals, pch = 16, col = "red")

par(mfrow=c(2,2))
plot(income.happiness.lm)
