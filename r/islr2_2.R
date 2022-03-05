# 2.3.1 - basic commands
x <- c(1, 3, 2, 5)
print(x)
x = c(1, 6, 2)
print(x)
y = c(1, 4, 3)
print(length(x))
print(length(y))
print(x + y)
print(ls())
rm(x, y)
print(ls())
?matrix
x = matrix(data = c(1, 2, 3, 4), nrow = 2, ncol = 2)
x
# w/o parameter names
x =  matrix(c(1, 2, 3, 4), 2, 2)
x
# fill matrix by row instead of columns
matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE)
sqrt(x)
x^2
# random numbers
x = rnorm(50)
y = x + rnorm(50, mean=50, sd=.1)
cor(x, y)
# using seed to reproduce random number
set.seed(1303)
rnorm(50)
# summary functions
set.seed(3)
y = rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

# 2.3.2 - graphics
?plot
x = rnorm(100)
y = rnorm(100)
plot(x, y)
plot(x, y, xlab="this is the x-axis",
     ylab="this is the y-axis",
     main="Plot of X vs Y")

# 2.3.4 - loading data
library(ISLR2)
View(Auto)
head(Auto)
dim(Auto)
# remove null rows (there are none)
Auto = na.omit(Auto)
dim(Auto)

# 2.3.5 - additional graphical and numerical summaries
# scatterplots generated from quantitative values
plot(Auto$cylinders, Auto$mpg)
# using attach to tell variables in dataframe available by name
attach(Auto)
plot(cylinders, mpg)
# convert variable to qualitative
cylinders = as.factor(cylinders)
# boxplots will appear with plot if x-axis is qualitative
plot(cylinders, mpg)
plot(cylinders, mpg, col="red")
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders")
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
# histograms
hist(mpg)
hist(mpg, col=2)
hist(mpg, col=2, breaks=15)
# scatterplot matrix
pairs(Auto)
pairs(
  ~ mpg + displacement + horsepower + weight + acceleration, data=Auto
)
# identify - click plot and hit esc to see values
plot(horsepower, mpg)
identify(horsepower, mpg, name)

# numerical summaries of each variable
summary(Auto)
summary(mpg)

# 2.4 - exercises (page 63)

