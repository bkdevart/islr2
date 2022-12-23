# 9.6.1 - Support Vector Classifier

# generate 2 linearly separable observations
set.seed(1)
x = matrix(rnorm(20 * 2), ncol = 2)  # break apart matrix, rnorm functions
y = c(rep(-1, 10), rep(1, 10))
x[y == 1, ] = x[y == 1, ] + 1
plot(x, col = (3 - y))

# fit the support vector
# scale = FALSE makes it so each feature does not have a mean zero/std dev of 1
dat = data.frame(x = x, y = as.factor(y))
# export this to csv file for python version
# write.csv(dat, "9_6_1_svm.csv", row.names=F)

library(e1071)
svmfit = svm(y ~ ., data = dat, kernel = "linear", cost = 10, scale = FALSE)

# plot with model classifications
plot(svmfit, dat)

