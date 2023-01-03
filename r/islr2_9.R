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

# check vector indexes
svmfit$index

summary(svmfit)

# using a smaller value for cost parameter
svmfit = svm(y ~ ., data = dat, kernel = "linear", cost = 0.1, scale = FALSE)
plot(svmfit, dat)
svmfit$index

# TODO: walk back to get pred, truth variables initialized
set.seed(1)
x = matrix(rnorm(200 * 2), ncol = 2)
x[1:100, ] = x[1:100, ] + 2
x[101:150, ] = x[101:150, ] - 2
y = c(rep(1, 150), rep(2, 50))
dat = data.frame(x = x, y = as.factor(y))

plot(x, col = y)

train = sample(200, 100)
svmfit = svm(y ~ ., data = dat[train, ], kernel = "radial", gamme = 1, cost = 1)
plot(svmfit, dat[train, ])

summary(svmfit)

svmfit = svm(y ~ ., data = dat[train, ], kernel = "radial", gamma = 1, cost = 1e5)
plot(svmfit, dat[train, ])

set.seed(1)
tune.out <- tune(svm, y ~ ., data = dat[train, ],
                 kernel = "radial", ranges = list(
                   cost = c(0.1, 1, 10, 100, 1000),
                   gamma = c(0.5, 1, 2, 3, 4) 
                 )
)
summary(tune.out)

table(
  true = dat[-train, "y"], pred = predict(
    tune.out$best.model, newdata = dat[-train, ]
  ) )

# 9.6.3 - ROC Curves
library(ROCR)
rocplot <- function(pred, truth, ...) {
  predob <- prediction(pred, truth)
  perf <- performance(predob, "tpr", "fpr")
  plot(perf, ...)
}

svmfit.opt = svm(y ~ ., data = dat[train, ], kernel = "radial", gamma = 2, cost = 1, decision.values = T)
fitted = attributes(
  predict(svmfit.opt, dat[train, ], decision.values = TRUE)
)$decision.values

par(mfrow = c(1, 2))
rocplot(-fitted, dat[train, "y"], main = "Training Data")
