library(BSDA)
library(goftest)

# T-test for difference between means of two independent groups

group1 <- c(175, 176, 177, 178, 179, 180, 181, 182, 183, 184)
group2 <- c(165, 166, 167, 168, 169, 170, 171, 172, 173, 174)

# T-test

# Two independent samples
#
# The t-test is a parametric test that is used to compare the means of two groups.
# The t-test assumes that the data is normally distributed.
t.test(x = group1, y = group2)

# Single sample
#
# The t-test can also be used to compare the mean of a group to a known value.
# For example, we could use the t-test to compare the mean height of men to the average height of women.
t.test(x = group1, mu = 0)

# Z-test

x <- c(10, 11, 12, 13, 14, 15)
mu <- 12.5

# The z-test is a special case of the t-test that is used when the population standard deviation is known.
# The z-test is also a parametric test and assumes that the data is normally distributed.
t.test(x = group1, mu = mean(group2), var.equal = TRUE)

# F-test

# Compare variances of two populations
#
# The F-test is a parametric test that is used to compare the variances of two populations.
# The F-test assumes that the data is normally distributed.
var.test(x = group1, y = group2)

# ANOVA
#
# ANOVA is an acronym for analysis of variance. ANOVA is a parametric test that is used to compare the means of three or more groups.
# ANOVA assumes that the data is normally distributed.

# Create a dataframe from group1 and group2
df <- data.frame(group = c(rep("Group 1", length(group1)), rep("Group 2", length(group2))),
                 value = c(group1, group2))

aov(value ~ group, data = df)

# Cramer-von Mises test
#
# Non-parametric test for comparing distributions
#
# Can be used to test:
#   * Difference between distributions of two or more groups
#   * Goodness-of-fit of a distribution to a hypothesized distribution
#
# The Cramer-von Mises test does not make any assumptions about the distribution of the data.
cvm.test(group1,"pnorm", mean = 0, sd=sd(group1))

# Create a vector of 100 random numbers
x <- rnorm(100, mean = 100, sd = 30)
cvm.test(x,"pnorm", mean = mean(x), sd=sd(x))
hist(x, breaks = 10)
