
library(magrittr)

set.seed(123)

claims <- rexp(10000, 0.0001)

hist(claims, main = "Histogram of 10,000 Simulated Claims Values from the Exponential Distribution")


mean(claims)

var(claims)


library(magrittr)  # pipe operator %>%

mean(claims) %>% round(3)

var(claims)   %>% round(3)

library(scales)    # Comma



mean(claims) %>% comma()

var(claims)  %>% comma()


##############

InsClaims3 <- pmin(claims, 20000)
mean(InsClaims3)
# 8671.328
var(InsClaims3)
# 43964610


ReClaims3 <- pmax(0, claims - 20000)
mean(ReClaims3)
# 1366.485
var(ReClaims3)
# 25047814



ReClaims3_alt <- claims[claims>20000]-20000
mean(ReClaims3_alt)
# 10099.67
var(ReClaims3_alt)
# 96978902


##########

InsClaims1	<-	pmin(claims,	5000)
InsClaims2	<-	pmin(claims,	10000)
InsClaims4	<-	pmin(claims,	30000)
InsClaims5	<-	pmin(claims,	40000)
InsClaims6	<-	pmin(claims,	50000)

MeanIns <- c(mean(InsClaims1), mean(InsClaims2),mean(InsClaims3), mean(InsClaims4), mean(InsClaims5),mean(InsClaims6))

MeanIns

VarIns <- c(var(InsClaims1), var(InsClaims2), var(InsClaims3), var(InsClaims4), var(InsClaims5),
var(InsClaims6))
VarIns

##############

ReClaims1 <- pmax(0, claims - 5000)
ReClaims2 <- pmax(0, claims - 10000)
ReClaims4 <- pmax(0, claims - 30000)
ReClaims5 <- pmax(0, claims - 40000)
ReClaims6 <- pmax(0, claims - 50000)
MeanRe <- c(mean(ReClaims1), mean(ReClaims2),
mean(ReClaims3), mean(ReClaims4), mean(ReClaims5),
mean(ReClaims6))
MeanRe


VarRe <- c(var(ReClaims1), var(ReClaims2),
var(ReClaims3), var(ReClaims4), var(ReClaims5),
var(ReClaims6))
VarRe



ReClaims1_alt <- claims[claims>5000] -5000
ReClaims2_alt <- claims[claims>10000]-10000


ReClaims4_alt <- claims[claims>30000]-30000
ReClaims5_alt <- claims[claims>40000]-40000
ReClaims6_alt <- claims[claims>50000]-50000
MeanRe_alt <- c(mean(ReClaims1_alt),mean(ReClaims2_alt),
mean(ReClaims3_alt), mean(ReClaims4_alt),
mean(ReClaims5_alt), mean(ReClaims6_alt))
MeanRe_alt

VarRe_alt <- c(var(ReClaims1_alt), var(ReClaims2_alt),
var(ReClaims3_alt), var(ReClaims4_alt),
var(ReClaims5_alt), var(ReClaims6_alt))
VarRe_alt



x <- c(5000, 10000, 20000, 30000, 40000, 50000)
plot(x, MeanIns, xlab = "Retention Limit", ylab = "Mean
amount paid by Insurer", main = "Mean Claim Amount for
Insurer by Retention Limit", type = "l")
plot(x, MeanRe, xlab = "Retention Limit", ylab = "Mean
amount paid by Reinsurer",main = "Mean Claim Amount for
Reinsurer by Retention Limit", type = "l")
plot(x, VarIns, xlab = "Retention Limit", ylab =
"Variance of amount paid by Insurer", main = "Variance
of Claim Amount for Insurer by Retention Limit", type =
"l")
plot(x, VarRe, xlab = "Retention Limit", ylab =
"Variance of amount paid by Reinsurer", main = "Variance
of Claim Amount for Reinsurer by Retention Limit", type
= "l")




x <- c(5000, 10000, 20000, 30000, 40000, 50000)
plot(x, MeanRe_alt, xlab = "Retention Limit", ylab = "Mean amount paid by Reinsurer",main = "Mean Claim Amount for
Reinsurer by Retention Limit", type = "l")

plot(x, VarRe_alt, xlab = "Retention Limit", ylab = "Variance of amount paid by Reinsurer", main = "Variance of Claim Amount
for Reinsurer by Retention Limit", type = "l")









(
TotalVar <- VarIns + VarRe
TotalVar
 87057204 72904822 69012424 79547654 89827408
94676012

This suggests that this retention limit might be the most appropriate in practice. 
[Max 6]
OR: Alternative relevant solutions based on conditional distribution of the
reinsurer is accepted. In this case,
Among the six retention limits investigated, the sum of the variance of the reinsurer
and the insurer is at a minimum at a retention limit of around Â£5,000


TotalVar_alt <- VarIns + VarRe_alt


TotalVar_alt
102134261 112224403 140943512 162690569 193094490
191582658

