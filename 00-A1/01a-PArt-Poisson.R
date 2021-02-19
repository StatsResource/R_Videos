
library(magrittr)

getOption("digits")

y <- c(87, 53, 72, 90, 78, 85, 83)
#y

mean(y) %>% round(3)

c(mean=mean(y), variance=var(y)) %>% round(3)

sd(y) %>% round(3)


xbar = s2 = numeric(10)

xbar
s2

x <- rpois(7, lambda= 78.29)
x


for (j in 1:10){

    x <- rpois(7, 78.29)
 
    xbar[j] <- mean(x)
 
    s2[j] <- var(x)

}


s2 %>% round(3)

xbar %>% mean() %>% round(3)


s2 %>% mean()%>% round(3)

xbar = s2 = numeric()

xbar
s2

N <- 1000

for (j in 1:N){

    x <- rpois(7, 78.29)
 
    xbar[j] <- mean(x)
 
    s2[j] <- var(x)

}


#xbar

xbar %>% mean() %>% round(3)

s2 %>% mean() %>% round(3)

mean(s2>159)


