# Load data
# install.packages('mlbench')
data(BreastCancer, package="mlbench")
bc <- BreastCancer[complete.cases(BreastCancer), ]  # keep complete rows

# remove id column
bc <- bc[,-1]
View(bc)
typeof(bc$Cell.size)
# convert to numeric
for(i in 1:9) {
  bc[, i] <- as.numeric(as.character(bc[, i]))
}

# Change Y values to 1's and 0's
bc$Class <- ifelse(bc$Class == "malignant", 1, 0)
bc$Class <- factor(bc$Class, levels = c(0, 1))
table(bc$Class)
levels(bc$Class)

# Prep Training and Test data.
library(caret)
'%ni%' <- Negate('%in%')  # define 'not in' func
options(scipen=999)  # prevents printing scientific notations.
set.seed(100)
trainDataIndex <- createDataPartition(bc$Class, p=0.7, list = F)
View(trainDataIndex)
trainData <- bc[trainDataIndex, ]
testData <- bc[-trainDataIndex, ]

# Class distribution of train data
table(trainData$Class)
table(testData$Class)
View(trainData)
# Down Sample
set.seed(100)
down_train <- downSample(x = trainData[, colnames(trainData) %ni% "Class"],
                         y = trainData$Class)
View(down_train)
table(down_train$Class)


# Up Sample (optional)
set.seed(100)
up_train <- upSample(x = trainData[, colnames(trainData) %ni% "Class"],
                     y = trainData$Class)

table(up_train$Class)

# Build Logistic Model
logitmod <- glm(Class ~ Cl.thickness + Cell.size + Cell.shape, family = "binomial", data=down_train)

summary(logitmod)

pred <- predict(logitmod, newdata = testData, type = "response")
pred

# Recode factors
y_pred_num <- ifelse(pred > 0.5, 1, 0)
y_pred_num
y_pred <-as.character(factor(y_pred_num, levels=c(0, 1)))
y_pred
y_act <- as.character(testData$Class)
y_act

showre<-cbind(y_act,y_pred)
colnames(showre)<-c("actual","predicted")
showre<-as.data.frame(showre)
View(showre)


# Accuracy
mean(y_pred == y_act)  # 94%

