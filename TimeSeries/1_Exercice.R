#2_ts Graphics autoplot

library(fpp2)

str(dole)
autoplot(dole)
?dole

autoplot(bricksq)
?bricksq

autoplot(lynx)
?lynx

autoplot(goog)
?goog

autoplot(goog) + 
  ylab("Day") + 
  xlab("closing stock price") + 
  ggtitle("Daily stock prices of Google")

# Seasonality and Trend
autoplot(a10) + ylab("$ million") + xlab("Year") +
  ggtitle("Antidiabetic drug sales")

# Plot seasonality per Month
ggseasonplot(a10, year.labels=TRUE, year.labels.left=TRUE) +
  ylab("$ million") +
  ggtitle("Seasonal plot: antidiabetic drug sales")

# Result Jan always high / Feb low / raising during between Feb to Jan
# Similar plot:

ggsubseriesplot(a10) + ylab("$ million") +
  ggtitle("Subseries plot:antidiabetic drug sales")

### Arrivals Dataset ###

?arrivals
str(arrivals)
 
autoplot(arrivals, facets = T)

ggseasonplot(arrivals[,1], year.labels=TRUE, year.labels.left=TRUE)  +
  ylab("Arrivals in k to Australia") +
  ggtitle("Seasonal plot: Arrivals from Japan to Australia")

ggseasonplot(arrivals[,2], year.labels=TRUE, year.labels.left=TRUE) +
  ylab("Arrivals in k to Australia") +
  ggtitle("Seasonal plot: Arrivals from New Zealand to Australia")

ggseasonplot(arrivals[,3], year.labels=TRUE, year.labels.left=TRUE) +
  ylab("Arrivals in k to Australia") +
  ggtitle("Seasonal plot: Arrivals from UK to Australia")

ggseasonplot(arrivals[,4], year.labels=TRUE, year.labels.left=TRUE) +
  ylab("Arrivals in k to Australia") +
  ggtitle("Seasonal plot: Arrivals from US to Australia")
