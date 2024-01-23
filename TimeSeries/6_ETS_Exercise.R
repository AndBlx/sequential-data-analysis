library(fpp2)

autoplot(bicoal)
train <- window(bicoal, end=1958)
test <- window(bicoal, start=1959)
fit <- ets(train)

fc <- forecast(fit, h=10, PI=F, level = c(80, 95))
autoplot(bicoal) + autolayer(fc, color="green")
accuracy(fc,test)

chicken
train <- window(chicken, end=1983)
test <- window(chicken, start=1984)
fit <- ets(train)

fc <- forecast(fit, h=10, PI=F, level = c(80, 95))
autoplot(chicken) + autolayer(fc$fitted, color="green") + autolayer(fc, color="red")
accuracy(fc,test)

checkresiduals(fc)


dole
train <- window(chicken, end=1983)
test <- window(chicken, start=1984)
fit <- ets(train)

fc <- forecast(fit, h=10, PI=F, level = c(80, 95))
autoplot(chicken) + autolayer(fc, color="green")
accuracy(fc,test)

usdeaths
bricksq
lynx
ibmclose
eggs
bricksq
ausbeer
