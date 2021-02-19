
library(magrittr)

options(repr.plot.width=8, repr.plot.height=5)

pdf <-function(x) {dgamma(x,0.75,0.3)}

plot.function(pdf,0,10)

sf <-function(x){ 1-pgamma(x,0.75,0.3) }

plot.function(sf,0,10)
title("Survival Function")


h1<-function(x) {dgamma(x,0.75,0.3)/(1-pgamma(x,0.75,0.3))}

plot.function(h1,0,10)
title("Hazard Function 1")



h2<-function(x) {dgamma(x,1,0.3)/(1-pgamma(x,1,0.3))}

plot.function(h2,0,10)

h3<-function(x) {dgamma(x,1.5,0.3)/(1-pgamma(x,1.5,0.3))}

plot.function(h3,0,10)


