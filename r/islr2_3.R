# 3.6.1 - libraries
library(MASS)
library(ISLR2)

# 3.6.2 - simple linear regression
head(Boston)
?Boston
attach(Boston)
# lm(y ∼ x, data), where y is the response, x is the 
# predictor, and data is the data set in which these 
# two variables are kept
lm.fit = lm(medv ~ lstat)
lm.fit
summary(lm.fit)
names(lm.fit)
coef(lm.fit)
confint(lm.fit)
# producing confidence intervals and prediction 
# intervals for medv for a given 
# value of lstat
predict(lm.fit, data.frame(lstat=(c(5, 10, 15))), interval="confidence")
predict(lm.fit, data.frame(lstat=(c(5, 10, 15))), interval="prediction")
# plot along with least squares regression
plot(lstat, medv)
abline(lm.fit)
# additional line/plot settings
abline(lm.fit, lwd=3)
abline(lm.fit, lwd=3, col='red')
plot(lstat, medv, col='red')
plot(lstat, medv, pch=20)
plot(lstat, medv, pch='+')
plot(1:20, 1:20, pch=1:20)
# split screen into separate panels
par(mfrow=c(2, 2))
plot(lm.fit)
# compute residuals
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
# leverage stats
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))  # shows observation with largest leverage stat

# 3.6.3 - multiple linear regression
# The syntax lm(y ∼ x1 + x2 + x3) is used to fit a 
# model with three predictors, x1, x2, and x3. The 
# summary() function now outputs the regression 
# coefficients for all the predictors.
lm.fit = lm(medv ~ lstat + age, data=Boston)
summary(lm.fit)
# regression using all predictors
lm.fit = lm(medv ~ ., data=Boston)
summary(lm.fit)
# access individual elements of summary object
# get r squared
summary(lm.fit)$r.sq
# get RSE
summary(lm.fit)$sigma


