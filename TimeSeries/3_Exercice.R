library(fpp2)


beer <- window(ausbeer, start=1992)
fc <- snaive(beer)
autoplot(fc)

checkresiduals(fc)
