x <- c(0.22,0.38,1.28,0.54,0.56,1.36,0.55,0.37,0.43,
       0.46,0.62,0.54,0.54,0.51,0.44,0.68,0.55,0.30)

mean(x)


t.test(x, conf=0.95)

# install.packages(c("magrittr","broom"))

library(magrittr)
library(broom)

t.test(x, conf=0.95) %>% tidy()

replicate(10, mean(sample(x,replace =TRUE)))
