library(fpp2)

#here we will store 200 simulations of length 30
#initial state is 0 for each simulation
rw<-matrix(nrow = 200, ncol=30)
rw[,1] <- 0
c <- 0.5
phi  <- 0.5

#copy the empty matrix
ar <- rw

#simulate the random walk and the AR1
for (row in (1:nrow(rw))){
  for (t in (2:ncol(rw))) {
    ar[row,t] <-  c + phi * ar[row,t-1] + rnorm(1)
    rw[row,t] <-  c + rw[row,t-1] + rnorm(1)
  }
}

#variance and mean at each time
#apply: applies a function to each row or column
#as we set margin=2, we obtain the mean for each x value (i.e., for each time instant)
varAr <-  apply(ar, 2, var)
meanAr <- apply(ar, 2, mean)

varRw <-  apply(rw,2,var)
meanRw <- apply(rw,2,mean)

#plot the variance of ar and rw at each time
plot(varRw, type = "l", col="red", lwd=2, ylab="var",xlab="time")
lines(varAr, type = "l", col="green", lwd=2)
legend(5,25,legend=c("RW", "AR"),col=c("red", "green"), lty = 1, lwd=2)


#plot the mean of ar and rw at each time
plot(meanRw, type = "l", col="red", lwd=2, ylab="mean",xlab="time")
lines(meanAr, type = "l", col="green", lwd=2)
legend(2,15,legend=c("RW", "AR"),col=c("red", "green"), lty = 1, lwd=2)


#autoplot expects the array ts to have the time as y axis,
#and the different columns to represent different ts
#hence, we transpose ar and rw before creating the ts objects
ar <- ts(t(ar))
rw <- ts(t(rw))

#plot all ts to see the variance and the mean
autoplot(ar, show.legend = FALSE)
autoplot(rw, show.legend = FALSE)


#plot only 5 ts to see how each of them looks like
autoplot(ar[,1:5], show.legend = FALSE)
autoplot(rw[,1:5], show.legend = FALSE)










autoplot(goog)
autoplot(diff(goog))

checkresiduals(diff(goog)) # looks more or less like noise -> so is a stationary process (even when the the distribution is not fully normal)

autoplot(usmelec) # clear trend and seasonality (multiplicative) and varaince is increasing -> therefore no stationary
autoplot(diff(usmelec, lag=12)) # (diff betweens seasons) still variance is increasing (due to multiplicative seasonality) -> no stationary process
#apply log of multiplicative makes it a additive one
autoplot(log(usmelec))
autoplot(diff(log(usmelec), lag=12)) # looks much more stationary

#second order differencing
autoplot(diff(diff(log(usmelec)), lag=12)) # looks quite similar to a stationary process
# now find a more strutucured and controlled way

autoplot(visitors)
autoplot(diff(diff(log(visitors)), lag=12))

autoplot(goog)
ndiffs(goog)# non seasonal 1-> apply diff
ndiffs(diff(goog)) # -> cant reject null hyp any more
nsdiffs(goog) # seasonal
nsdiffs(log(visitors))
nsdiffs(diff(log(visitors))

# statistical test with null hyp. that the ts is stationary





