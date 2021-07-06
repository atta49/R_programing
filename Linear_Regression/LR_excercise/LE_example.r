#Load the dataset, and plot the sales variable. 
auto<-read.csv('vehicles.csv')
     tail(auto)
plot(auto$sales,
     type="l",
     ylim=c(0,5000),
     ylab = "Sales,000units",
     xlab = "periods",
     main = "US light weight vechicle sales from 1976-2016")
     #lines(auto$sales)
#Create the trend variable (by assigning a successive number to each observation),
#and lagged versions of the variables income, unemp, and rate (lagged by one period).
#Add them to the dataset.
#(Note that the base R libraries do not include functions for creating lags 
#for non-time-series data, so the variables can be created manually).   
auto$trend <- seq(1:nrow(auto))
auto$income_lag <- c(NA, auto$income[1:nrow(auto)-1])
auto$unemp_lag <- c(NA, auto$unemp[1:nrow(auto)-1])
auto$rate_lag <- c(NA, auto$rate[1:nrow(auto)-1])



#Run all possible linear regressions with sales as the dependent variable and 
#the others as independent variables using the regsubsets function from the 
#leaps package (pass a formula with all possible dependent variables, 
#and the dataset as inputs to the function).
#Plot the output of the function.
require(leaps)
regressions_result <- regsubsets(sales ~ ., data = auto)
plot(regressions_result, col = colorRampPalette(c("darkgreen", "grey"))(10))


#Note that regsubsets returns only one “best” model (in terms of BIC) for each possible number of dependent variables.
#Run all regressions again, but increase the number of returned models for each size to 2.
#Plot the output of the function.
require(leaps)
regressions_result_extended <- regsubsets(sales ~ ., data = auto, nbest = 2)
plot(regressions_result_extended, col = colorRampPalette(c("darkgreen", "grey"))(10))


#Look at the plots from the previous exercises and find the model with the lowest value of BIC.
#Run a linear regression for the model, save the result in a variable, and print its summary.
fit <- lm(sales ~ unemp + rate + unemp_lag + rate_lag, data = auto)
summary(fit)
par(mfrow=c(2,2))
plot(fit)


#Load an additional dataset with assumptions on future values of dependent variables.
#Use the dataset and the model obtained in the previous exercise to make a forecast
#for the next 4 quarters with the forecast function (from the package with the same name).
#Note that the names of the lagged variables in the assumptions data have to be identical
#to the names of the corresponding variables in the main dataset.
#Plot the summary of the forecast.
#install.packages("forecast")
#library(forecast)
require(forecast)
assumptions <- read.csv("vehicles_assumptions.csv")
View(assumptions)
fcast <- forecast(fit, newdata = assumptions, h = 4)
summary(fcast)


#The plot function does not automatically draw plots for forecasts obtained from regression
#models with multiple predictors, but such plots can be created manually.
#As the first step, create a vector from the sales variable, and append the forecast 
#(mean) values to this vector. Then use the ts function to transform the vector to 
#a quarterly time series that starts in the first quarter of 1976.

fcast_sales <- append(auto$sales, fcast$mean)
fcast_sales <- ts(fcast_sales, start = c(1976, 1), frequency = 4)


#Plot the forecast in the following steps:
#(1) create an empty plot for the period from the first quarter of 2000 to the fourth quarter of 2017,
#(2) plot a black line for the sales time series for the period 2000-2016,
#(3) plot a thick blue line for the sales time series for the fourth quarter of 2016 and all quarters of 2017.
#Note that a line can be plotted using the lines function, and a subset of a time series can be obtained with the window function.

plot(window(fcast_sales, start = c(2000,1), end = c(2017,4)),
     type = "n",
     ylab = "Sales, '000 units",
     main = "Light Weight Vehicle Sales")
lines(window(fcast_sales, start = c(2000,1), end = c(2016,4)))
lines(window(fcast_sales, start = c(2016,4), end = c(2017,4)), col = "blue", lwd = 3)

#Perform the Breusch-Godfrey test (the bgtest function from the lmtest package) to test the 
#linear model obtained in the exercise 5 for autocorrelation of residuals.
#Set the maximum order of serial correlation to be tested to 4.
#Is the autocorrelation present?
#(Note that the null hypothesis of the test is the 
#absence of autocorrelation of the specified orders).
require(lmtest)
bgtest(fit, 4)

#Use the Pacf function from the forecast package to explore autocorrelation of residuals
#of the linear model obtained in the exercise 5. Find at which lags partial correlation
#between lagged values is statistically significant at 5% level.
#Residuals can be obtained from the model using the residuals function.
require(forecast)
res <- residuals(fit)
Pacf(res)
