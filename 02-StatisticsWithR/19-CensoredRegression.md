
### Censored Regression
* Example 3. Consider the situation in which we have a measure of academic aptitude (scaled 200-800) which we want to model using reading and math test scores, as well as, the type of program the student is enrolled in (academic, general, or vocational). 

* The problem here is that students who answer all questions on the academic aptitude test correctly receive a score of 800, even though it is likely that these students are not “truly” equal in aptitude. 
* The same is true of students who answer all of the questions incorrectly. All such students would have a score of 200, although they may not all be of equal aptitude.




```R

# function that gives the density of normal distribution
# for given mean and sd, scaled to be on a count metric
# for the histogram: count = density * sample size * bin width
f <- function(x, var, bw = 15) {
  dnorm(x, mean = mean(var), sd(var)) * length(var)  * bw
}
```


```R
library(ggplot2)

# setup base plot
p <- ggplot(dat, aes(x = apt, fill=prog))



```


    Error in ggplot(dat, aes(x = apt, fill = prog)): object 'dat' not found
    Traceback:


    1. ggplot(dat, aes(x = apt, fill = prog))



```R
# histogram, coloured by proportion in different programs
# with a normal distribution overlayed
p + stat_bin(binwidth=15) +
  stat_function(fun = f, size = 1,
    args = list(var = dat$apt))

p + stat_bin(binwidth = 1) + stat_function(fun = f, size = 1, args = list(var = dat$apt, 
    bw = 1))
```


```R
cor(dat[, c("read", "math", "apt")])
##        read   math    apt
## read 1.0000 0.6623 0.6451
## math 0.6623 1.0000 0.7333
## apt  0.6451 0.7333 1.0000
# plot matrix
```


```R
ggpairs(dat[, c("read", "math", "apt")])

```


```R




dat$yhat <- fitted(m)[,1]
dat$rr <- resid(m, type = "response")
dat$rp <- resid(m, type = "pearson")[,1]


```


    Error in is.data.frame(x): object 'dat' not found
    Traceback:


    1. cor(dat[, c("read", "math", "apt")])

    2. is.data.frame(x)



```R
par(mfcol = c(2, 3))

with(dat, {
  plot(yhat, rr, main = "Fitted vs Residuals")
  qqnorm(rr)
  plot(yhat, rp, main = "Fitted vs Pearson Residuals")
  qqnorm(rp)
  plot(apt, rp, main = "Actual vs Pearson Residuals")
  plot(apt, yhat, main = "Actual vs Fitted")
})
```
