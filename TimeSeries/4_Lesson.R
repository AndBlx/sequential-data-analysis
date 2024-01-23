library(fpp2)
oildata <- window(oil, start=1996)
#Estimate parameters (l0 and alpha)
#by minimizing the sum of squared residuals.
fc <- ses(oildata, h=5)
#the summary shows:
# - point forecasts and prediction intervals
# - estimated parameters
# - MAE, MAPE etc. on the training set
str(fc)
summary(fc)
autoplot(fc) # looks like FC of naive method. Because it is based on a alpha (estimated in sees) very close to 1.

autoplot(fc$fitted)

autoplot(fc) + autolayer(fc$fitted) # now we can see a small difference. Naive would be exactly the same value as t, but due to alpha we can see a small diference to t-1

# Holts method
window(ausair, start=1990, end=2004) %>%
holt(h=5) %>% autoplot()
