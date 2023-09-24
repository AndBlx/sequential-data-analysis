#define data
x <- c(22, 24, 25, 25, 28, 29, 34, 37, 40, 44, 51, 48, 47, 50, 51)

library(tseries)

#calculate autocorrelations
acf(x, pl=FALSE)
acf(x, lag=5, pl=FALSE)
acf(x)


### Correlation ####
head(mtcars, 5)
library(tidyverse)
dat <- mtcars %>%
  select(-vs, -am)

cor(dat$hp, dat$mpg)
cor(dat$wt, dat$disp)

pairs(dat)

cor(dat$hp, dat$mpg,
    method = "spearman"
)

## Correlation Matrix ##
round(cor(dat),
      digits = 2 # rounded to 2 decimals
)

# improved correlation matrix
library(corrplot)

corrplot(cor(dat),
         method = "number",
         type = "upper" # show only upper side
)

# Pearson correlation test
test <- cor.test(dat$drat, dat$qsec)
test


# Data generation
y <- dat$wt
x <- dat$disp

# Creating the plot
plot(x, y, pch = 19, col = "lightblue")

# Regression line
abline(lm(y ~ x), col = "red", lwd = 3)

# Pearson correlation
text(paste("Correlation:", round(cor(dat$wt, dat$disp), 2)), x = 100, y = 5)

     