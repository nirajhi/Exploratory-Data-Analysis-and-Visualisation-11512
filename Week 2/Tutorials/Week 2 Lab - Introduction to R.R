# Exploratory Data Analysis and Visualisation 11374/11517
# Week 2 Lab 
# Introduction to R

# example: defining a function
hello<-function() cat("Hello, world!")
hello()
# that would return you the text

# another example
cube<-function(x) {x^3}
cube(1)
cube(3)

# arithmetic operators in R
# + addition
# - subtraction
# * multiplication
# / division
# ^ exponentiation (i.e. raising to power)
# == is equal to
# ! = is not equal to
# < is less than
# <= is less than or equal to
# > is greater than
# >= is greater than or equal to
# && and
# || or
# ! not

# example: logic test
3 < 5
3 > 5
3 > 5 || 3 < 5

# abs() the absolute value of the argument
# floor() the integer part of the argument
# sqrt() the square root of the argument
# exp(), log(), log10() exponential and log functions
# sin(), cos(), tan() trigonometric functions
# asin(), acos(), atan() inverse trigonometric functions
# sinh(), cosh(), tanh() hyperbolic functions
# asinh(), acosh(), atanh() inverse hyperbolic functions

# trigonometric inputs should be in radians, not degree
# 30 = pi/6,  180 = pi
sin(pi/6)
sin(pi)

# storing objects
c<-5
c^3
c*5
sin(c)

# view stored objects
objects()
ls()

# to remove objects
rm(c)

# seq function
seq(10)
help(seq)
seq(2,20,2)

# rep function
rep(10)
help(rep)
rep(10,10)
rep(1,10)

# creating vector
x <- c(1, 0, 0)
y <- c(1, 2, 0)
z <- c(1, 2, 5)

# functions which can be applied on vectors

# length(x) number of elements in the argument x
# sort(x) sorts the elements of x into ascending order
# order(x) gives the ranks of the elements of x
# max(x), min(x) maximum or minimum of elements of x
# median(x) median value of the elements of x
# sum(x) sum of elements in x
# prod(x) product of elements in x
# mean(x) mean of all elements in x
# mean(x,trim=0.25) 25% trimmed mean of all elements in x
# var(x) sample variance-covariance matrix of x
# cor(x) sample correlation matrix of x


# creating matrices
cbind(x, y, z)
rbind(x, y, z)

# naming the matrix
mymat <- rbind(x, y, z)

# matrix operators
# ncol(amat) number of columns of amat
# nrow(amat) number of rows of amat
# t(amat) transpose of amat
# solve(amat) inverse of amat

# apply (matrix, 1 or 2, vector function)
# 1= row-wise, 2= column-wise
help(apply)
# here is mymat
mymat
# to calculate the mean of each column
apply(mymat,2,mean)
# to calculate the mean of each row
apply(mymat,1,mean)
# to sort row, R by default is column binding
apply(mymat,1,sort)
t(apply(mymat,1,sort))
# to sort column
apply(mymat, 2, sort)

# sweep, minus something from your matrix
help(sweep)
# every column -1
sweep(mymat, 2, 1)
# every column - its own mean
sweep(mymat, 2, apply(mymat, 2, mean))

# more examples of vector operations
y + z
y - z
y * z

# matrix multiplication
mymat %*% solve(mymat)

# correct an entry in vector
z
z[3]<-3
z

# matrix before
mymat
# locate an entry in a matrix
# [row, column]
# eg: row 3 column 3
mymat[3,3]

# rewrite the particular entry
mymat[3,3]<-3
# matrix after
mymat

# reading a dataset
# check for heading
# set the appropriate name
colnames(women)
# rename if necessary
names(women)<-c("Height","Weight")
colnames(women)

# attach data - this allows us to refer to the variable names within the dataset
attach(women)
Height
Weight

stem(Height)
stem(Weight)
hist(Height)
hist(Weight)
boxplot(Height,Weight)
plot(Height,Weight)

# to join the points on the plot
plot(Height,Weight,type="l")

# plotting tips
plot(Height,Weight,main="women", sub="a scatterplot", ylab="w", xlab="h")

# type= "l" to plot lines; "p" for points; "b" for both
# pch= A numeric value specifies a specific plotting symbol:
#  0=square, 1=octagon, 2=triangle,3=cross,
# 4=X, 5=diamond, 6=inverted triangle, etc.
# A character in double-quotes specifies a user-chosen plotting symbol
# (e.g. "o" will plot a lower-case "o" as the plotting symbol)
# lty= 1 for a solid line, 2 or higher for varying degrees of dashed or dotted lines
# col= 1 for black, 2= red, ...

plot(Height,Weight)
# adding a line
# abline(c(intercept,gradient))
abline(lsfit(Height,Weight)$coef)

# plotting with colours
plot(Height,Weight,pch=5)
abline(lsfit(Height,Weight)$coef, lty= 4, col=4)
# inserting text
text(66,128,labels="least-sq regression", col=4)

# inserting legend
help(legend)

plot(Height,Weight,pch=5)
abline(lsfit(Height,Weight)$coef, lty= 4, col=4)

legend(60,160,c("observation", "fitted line"), col = c(1, 4),
       lty = c(NA, 4), pch = c(5, NA))
