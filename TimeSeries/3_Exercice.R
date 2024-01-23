library(fpp2)


beer <- window(ausbeer, start=1992)
fc <- snaive(beer)
autoplot(fc)

checkresiduals(fc)

naive(goog200, level=95)
snaive(goog200, level=95)
meanf(goog200, level=95)
rwf(goog200, level=95)

naive(goog200, level=20)
snaive(goog200, level=99)
meanf(goog200, level=99)
rwf(goog200, level=99)

checkresiduals(naive(goog200))
checkresiduals(snaive(goog200))
checkresiduals(meanf(goog200))
checkresiduals(rwf(goog200))
