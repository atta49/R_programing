
####################################################
############# Regression Analysis ##################
####################################################

head(cars)  # display the first 6 observations
cars
# Graphical Analysis
# Scatter Plot
scatter.smooth(x=cars$speed, y=cars$dist, main="Dist ~ Speed")  # scatterplot

# Boxplot
par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(cars$speed, main="Speed", sub=paste("Outlier rows: ", boxplot.stats(cars$speed)$out))  # box plot for 'speed'
boxplot(cars$dist, main="Distance", sub=paste("Outlier rows: ", boxplot.stats(cars$dist)$out))  # box plot for 'distance'
summary(cars$speed)
# Density plot 
# check if the response variable is close to normality
#install.packages('e1071')
library(e1071)
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(cars$speed), main="Density Plot: Speed", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(cars$speed), 2)))  # density plot for 'speed'
polygon(density(cars$speed), col="red")
plot(density(cars$dist), main="Density Plot: Distance", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(cars$dist), 2)))  # density plot for 'dist'
polygon(density(cars$dist), col="red")


# Build Linear Mode
linearMod <- lm(dist ~ speed, data=car)  # build linear regression model on full data
print(linearMod)

# Analysis of Model Output
summary(linearMod) 

######################################
############# Step 1 #################
######################################
# Create Training and Test data
set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(cars), 0.8*nrow(cars))  # row indices for training data
trainingData <- cars[trainingRowIndex, ]  # model training data
testData  <- cars[-trainingRowIndex, ]   # test data

######################################
############# Step 2 #################
######################################
# Build the model on training data -
lmMod <- lm(dist ~ speed, data=trainingData)  # build the model

######################################
############# Step 3 #################
######################################
# Review diagnostic measures.
summary (lmMod)  # model summary
AIC (lmMod)  # Calculate akaike information criterion
BIC(lmMod)

######################################
############# Step 4 #################
######################################
# Compute Prediction + Calculate prediction accuracy and error rates.
distPred <- predict(lmMod, testData)  # predict distance
actuals_preds <- data.frame(cbind(actuals=testData$dist, predicteds=distPred))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)
correlation_accuracy
head(actuals_preds)

# Other Metric - MeanAbsolutePercentageError
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)  
mape
