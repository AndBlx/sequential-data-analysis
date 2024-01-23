library(fpp2)

#### Holts-Winters ####
aust <- window(austourists, end=2005)
fit1 <- hw(aust, seasonal = 'additive', PI = F)
fit2 <- hw(aust, seasonal = 'multiplicative', PI = F)

autoplot(austourists) + autolayer(fit1, color='green') + autolayer(fit2)

summary(fit1) #Beta near 0 nearly no update on the Trend / gamme near 0 no changing (update) of Seasonality 
summary(fit2) #alpha slightly changed to fit1
# small gamma is good -> stable seasonal pattern 
# gamma high means season has to be adjusted all the time (not optimal)

#### Cleare Differenc between additive and multiplicative: ####

aust2 <- window(austourists, start=2005)
fit3 <- hw(aust2, seasonal = 'additive', PI = F)
fit4 <- hw(aust2, seasonal = 'multiplicative', PI = F)

autoplot(austourists) + autolayer(fit3, color='green') + autolayer(fit4)

summary(fit3) # gamma pretty high means that seasonality has to be updated all the time (Oscillation Impact is always the same due to adding it)
summary(fit4) # much better gamma with mulitplication because the change is proportanial (Oscillation Impact with higher y is larger and vice versa)

#### gas time series: ####
autoplot(gas)
(gas)

gasTrain <- window(gas, end = 1990)
gasHWadd <- hw(gasTrain, seasonal = 'additive', PI = F, h=240)
gasHWmult <- hw(gasTrain, seasonal = 'multiplicative', PI = F, h=240)
gasHWmultDamped <- hw(gasTrain, seasonal = 'multiplicative', PI = F, h=240, damped = T)

summary(gasHWadd)
summary(gasHWmult) # good model due to large oscillation as time progresses
summary(gasHWmultDamped) # best model with damped parameter, can raise indefinitely 
accuracy(gasHWmultDamped,gas)

autoplot(gas) + autolayer(gasHWadd, color='green') + autolayer(gasHWmult) + autolayer(gasHWmultDamped, color='red')

checkresiduals(gasHWmultDamped)


#### Takse to choose mult or add.:

windowTrain <- window(gas, start=1970, end = 1980)
windowTest <- window(gas, start=1980, end = 1990)

gasFitAdd = hw(windowTrain, seasonal = 'additive', h=120) #alpha near 1 no update of the level (means more or less the naive method)
gasFitMult = hw(windowTrain, seasonal = 'multiplicative', h=120) # Good sign of gamma mult seams to capture already the seasonality no updated needed

summary(gasFitAdd)
summary(gasFitMult)

accuracy(gasFitAdd, windowTest)
accuracy(gasFitMult, windowTest)

autoplot(window(gas, start=1980, end=1990)) + autolayer(gasFitAdd, color='green', PI = FALSE) + autolayer(gasFitMult, color='red',PI=FALSE) 
# Additive is just added on top of the level - multiplicative growths bigger or smaller with the y value (bigger oscillation)         

