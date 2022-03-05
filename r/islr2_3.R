# 3.6.1 - libraries
library(MASS)
library(ISLR2)

# 3.6.1 - simple linear regression
head(Boston)
attach(Boston)
lm.fit = lm(medv ~ lstat)
lm.fit
summary(lm.fit)
names(lm.fit)
coef(lm.fit)
confint(lm.fit)
