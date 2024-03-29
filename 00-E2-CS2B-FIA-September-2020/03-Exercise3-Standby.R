---
title: "Statistics with R"
subtitle: "Statistical Modelling with R for Actuarial Students"
output:
  xaringan::moon_reader:
    lib_dir: libs
    nature:
      highlightStyle: github
      countIncrementalSlides: false
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(magrittr)
library(knitr)


```

```{css, echo=FALSE}
pre {
  background: #ADD8E6;
  max-width: 100%;
  overflow-x: scroll;
}
```

***CS2B – Risk Modelling and Survival Analysis ***


* The emphasis is placed on being able to apply statistical methods to actuarial problems using real data sets and the open-source software environment R. 

* Time Series. Probability Distributions, Survival Analysis

---

Solution 3:
  i)
> BMI <- read.csv("BMIClaims.csv")
> n <- length(BMI$BMI)
> alpha <- 0.05
...
[2]
> sqrt(c((n-1)*var(BMI$BMI)/qchisq(1-alpha/2,df=n-1),(n-1)*var(BMI$BMI)/qchisq(alpha/2
                                                                               ,df=n-1)))
[2]
[1] 5.920028 7.434763
[2]
[6]

---
  
  ii)
> sigma <- 4
> statistic <- (n-1)*var(BMI$BMI)/sigma^2
> statistic
[1] 404.5421
> qchisq(alpha/2,n-1)
[1] 117.098
> qchisq(alpha/2,n-1,lower=FALSE)
[1] 184.687
> 2*(pchisq((n-1)*var(BMI$BMI)/sigma^2,df=n-1,lower.tail=FALSE))
[1] 3.564503e-25
[1]
[2]
[1]
Since p-value is less than 5%, there is sufficient evidence to reject the hypothesis,
i.e. the standard deviation of BMI is not equal to 4.
[2]
[6]
iii)
> x <- nrow(BMI[BMI$BMI>30,])
> binom.test(x,n,conf.level = 0.99)

---
  
  Exact binomial test
data: x and n
number of successes = 10, number of trials = 150, p-value < 2.2e-16
alternative hypothesis: true probability of success is not equal to 0.5
99 percent confidence interval:
  0.02522882 0.13728337
sample estimates:
  probability of success
0.06666667
Since 99% CI for p doesn't contain p=0.2
it is unlikely that the proportion of obese policyholders is more than 20%.. ..
[1]
[1]
[1]
[6]
iv)
> table(BMI$BMI>30,BMI$ClaimCount)
0
FALSE 133
TRUE
7
1
7
3
> y <- c(3,7)
> m <- c(10,140)
> poisson.test(y,m)

---
  
  Comparison of Poisson rates
data: y time base: m
count1 = 3, expected count1 = 0.66667, p-value = 0.02493
alternative hypothesis: true rate ratio is not equal to 1
95 percent confidence interval:
  1.001171 26.282304
sample estimates:
  rate ratio
6
Since p-value is less than 5% i.e. 2.5%, there is sufficient evidence to reject the hy
pothesis, i.e. Claim frequency is different between obese and others.
(Alternatively, can use prop.test)

---