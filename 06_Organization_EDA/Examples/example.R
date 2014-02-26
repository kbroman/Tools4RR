#' This is a simple example of an R file for use with KnitR's spin().

# This comment will appear as code rather than text.

#' We'll start by setting the seed for the random number generator.
set.seed(53079239)

#' We'll first simulate some data with x ~ N(mu=10, sig=5) and
#' y = 2x + e, where e ~ N(mu=0, sig=2)
x <- rnorm(100, 10, 5)
y <- 2*x + rnorm(100, 0, 2)

#' Here's a scatterplot of the data.
plot(x, y, pch=21, bg="slateblue", las=1)

#' The estimated correlation between x and y is
cor(x,y)

#' Here is the result of regressing $y$ on $x$.
out <- lm(y ~ x)
summary(out)

#' So note that the estimated slope for the regression line is
out$coef[2]
