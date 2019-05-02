# The file play around with Econometrics


# Library -----------------------------------------------------------------
library(tidyverse)
library(readr)

# Read the data -----------------------------------------------------------
intro_auto <- read_csv("intro_auto.csv")
View(intro_auto)
names(intro_auto)
summary(intro_auto)
sd(intro_auto$mpg)
summary(mpg)
length(intro_auto$mpg)
sort(intro_auto$make)
table(intro_auto$make)
table(intro_auto$make, intro_auto$foreign)
#' Here I test whether it is possible to avoid the mentioning of dataset 
#'   multiple times.
with(intro_auto, (table(make, foreign)))

# Statistical Analysis ----------------------------------------------------
with(intro_auto, cor(price, mpg))
ggplot(data = intro_auto) +
  geom_point(mapping = aes(x = price, y = mpg), color = intro_auto$repairs)

#' T-test for mean of one group
t.test(intro_auto$mpg, mu=20)

#' ANOVA for equality of means of two groups
with(intro_auto, anova(lm(mpg ~ factor(foreign))))

#' OLS regression: DV = mpg, IV = weight + lenght + foreign
olsreg <- with(intro_auto, lm(mpg ~ weight + length + foreign))
summary(olsreg)
#' Or in a more direct way
summary(with(intro_auto, lm(mpg ~ weight + length + foreign)))

#' Plotting data
with(intro_auto, plot(mpg ~ weight))
?plot
#' Example: plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10,
#'          main = "rpois(100, lambda = 5)")
# Example: plot(cars)
# Example: lines(lowess(cars))
olsreg1 <- with(intro_auto, lm(mpg ~ weight))
plot(olsreg1) 
abline(olsreg1)
plot(olsreg)

intro_auto$weight1 <- intro_auto$weight/1000
Y <- with(intro_auto, cbind(mpg))
X1 <- with(intro_auto, cbind(weight1))
X <- with(intro_auto, cbind(weight1, price, foreign))
View(intro_auto)
cor(Y, X)
plot(X1, Y)
summary(lm(Y ~ X1))
confint(lm(Y ~ X1), level = 0.95)
