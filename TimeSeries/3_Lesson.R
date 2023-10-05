library(fpp2)
library(goftest)

fc <- naive(goog200)

str(fc)

fc$method
fc$model
fc$fitted

autoplot(fc)
str(fc$fitted[200])
str(goog200[200])
#  Forecast per time step, go to next time step again forecast used for residuals.
# Residuals compare fitted value to true value. Large residuals means large gap between forecasted and actual value.

autoplot(fc$residuals)
# spike indicates that naive model seems not to be perfect for stock prices
# Residuals are a basic measure of accuracy.

resids = residuals(naive(goog200))
str(checkresiduals(resids))

ksTest = ks.test(resids,rnorm(1000,0,sd(resids[-1])))
ksTest

fcmean <- meanf(goog200)
fcmean$method
fcmean$model
fcmean$fitted # fitted values are all the same in mean ts

#-----

beer2 <- window(ausbeer, start=1992, end=c(2007,4))
beer3 <- window(ausbeer, start=2008)
beerfit1 <- meanf(beer2, h=10)
beerfit2 <- rwf(beer2, h=10)
beerfit3 <- snaive(beer2, h=10)

str(accuracy(beerfit1, beer3))

accuracy(beerfit1, beer3)
accuracy(beerfit2, beer3)
accuracy(beerfit3, beer3)


