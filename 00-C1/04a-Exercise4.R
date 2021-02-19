
library(magrittr)

x <- c(18,23,25,35,65,54,34,56,72,19,23,42,18,39,37)

y <- c(202,186,187,180,156,169,174,172,153,199,193,174,198,183,178)

plot(x,y)

plot(x,y,pch=18)

lm.result = lm(y ~ x)

# Obtain the basic values of the regression analysis

lm.result

# make a plot
plot(x,y,pch=18)

# plot the regression line
abline(lm(y ~ x)) 



summary(lm.result)

confint(lm.result) %>% round(2)

es <- resid(lm.result)
# the residuals lm.result

es %>% round(3)

b1 <- (coef(lm.result))[['x']] #the x part of the coefficients
n  <-  15

b1 %>% round(3)

n

s  <-  sqrt( sum( es^2 ) / (n-2) )
SE <-  s/sqrt(sum((x-mean(x))^2))

t  <-  (b1 - (-1) )/SE
t

pt(t,13,lower.tail=FALSE)


The p-value is twice this as the problem is two-sided,




2 * pt(t,13,lower.tail=FALSE)

## Exercise 4


