library(fpp2)

help(chicken)
autoplot(chicken)


train <- window(chicken, end=1980)
test <- window(chicken, start=1981)
sesFit <- ses(train, h =length(test))
holtFit <- holt (train, h =length(test))
holtFitDamped <- holt (train, damped = T, h =length(test))

summary(sesFit)
summary(holtFit)

sesFit$model$mse
holtFit$model$mse
holtFitDamped$model$mse

sesFit$model$aic
holtFit$model$aic
#AIC suggests to choose the ses model
holtFitDamped$model$aic


accuracy(sesFit, test)
accuracy(holtFit, test)
# Holt overfitted (difference between train and test)



autoplot(chicken) + autolayer (sesFit, color='blue', PI=F) + autolayer (holtFit, color='red', PI=F) + autolayer (holtFitDamped, color='green', PI=F) 


best <- ets(train)
autoplot(best)
AAN <- ets(chicken, model = 'AAN')
autoplot(AAN)

fcUSDeaths = forecast(ets(usdeaths), h=10)
autoplot(usdeaths) + autolayer(fcUSDeaths, color='red')
