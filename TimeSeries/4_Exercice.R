library(fpp2)

show(eggs)
autoplot(eggs)

eggsShort <- window(eggs, end=1980)
fcSes <- ses(eggsShort, h=100, PI=F)
fcHolt <- holt(eggsShort, h=100, PI=F)
fcHoltDamped <- holt(eggsShort, h=100, damped = T, PI=F)

autoplot(eggs) + autolayer(fcHolt, color='green') + autolayer(fcHoltDamped, color = 'blue') + autolayer(fcSes, color = 'red')

summary(fcHolt)
summary(fcHoltDamped) # parameters alpha near 1 nearly no memory and other parameters realy extreme (seems something wrong with the model)

checkresiduals(fcHolt)

fcHoltDamped$model$par
fcHoltDamped$model$states

# Calc exp. smoothing
446*(1-0.8) + 0.8 * 445
445.2*(1-0.8) + 0.8 * 454

#Holts linear calculation
level1 <- 0.8 * 445 + (1-0.8) * (445 + 9)
trend1 <- 0.7 * (446.8 - 445) + (1-0.7) * 9

level2 <- 0.8 * 454 + (1-0.8) * (446.8 + 3.96)
trend2 <- 0.7 * (453.3 - 446.8) + (1-0.7) * 3.96
