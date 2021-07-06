freeny<-datasets::freeny
View(freeny)
plot(freeny,col="navy",main="matrix scatterplot")
# Constructing a model that predicts the market potential using the help of revenue price.
#indexand income.level
model <- lm(market.potential ~ price.index + income.level, data = freeny)
#model <- lm(market.potential ~ price.index + income.level+ y, data = freeny)
#model <- lm(market.potential ~ lag.quarterly.revenue + income.level+ y, data = freeny)
model
summary(model)

# model prediction
y<-13.27199+(-0.30929)*5.4532+(0.19631)*5.4559
y
