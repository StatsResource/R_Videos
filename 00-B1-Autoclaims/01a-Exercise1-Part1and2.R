
# sessionInfo()

### AutoClaims

library(readr)
AutoClaims <- read_csv("AutoClaims.csv")


state_mean<-aggregate(PAID~STATE,data = AutoClaims,FUN = mean)
names(state_mean)<-c("State","Mean")


state_mean 

state_sd<-aggregate(PAID~STATE,data = AutoClaims,FUN = sd)
names(state_sd)<-c("State","SD")


state_sd


state_summary<-merge(state_mean,state_sd)

state_summary

state_summary$CV <- state_summary$SD / state_summary$Mean

#Mean, Standard Deviation and Coefficient of Variance for each state

state_summary



The State with minimum coefficient of variance is

```{r}
state_summary$State[state_summary$CV==min(state_summary$CV)]
```




The State with maximum coefficient of variance is

```{r}
state_summary$State[state_summary$CV==max(state_summary$CV)]
```


The State with minimum coefficient of variance is

```{r}
state_summary$State[state_summary$CV==min(state_summary$CV)]
```



The State with maximum coefficient of variance is

```{r}
state_summary$State[state_summary$CV==max(state_summary$CV)]
```


#### State Summarys (Tidyverse)

```{r}
library(dplyr)
library(magrittr)

state_summary_tidy <- AutoClaims %>% group_by(STATE) %>%
                         summarize(Mean = mean(PAID),
                                   SD   = sd(PAID))

```
```{r}
head(state_summary_tidy)
```

```{r}
state_summary_tidy <- AutoClaims %>% group_by(STATE) %>%
                         summarize(Mean = mean(PAID),
                                   SD   = sd(PAID)) %>%
                         mutate(CV = Mean/SD) %>%
                         arrange(CV)

```  



### Claims (Base R)

```{r}
Class_mean<-aggregate(PAID~CLASS,data = AutoClaims,FUN = mean)
names(Class_mean)<-c("Class","Mean")
Class_sd<-aggregate(PAID~CLASS,data = AutoClaims,FUN = sd)
names(Class_sd)<-c("Class","SD")
Class_summary<-merge(Class_mean,Class_sd)
Class_summary$CV<-Class_summary$SD/Class_summary$Mean
#Mean, Standard Deviation and Coefficient of variance for each rating class
Class_summary
```



```{r}
Class_summary[order(Class_summary$CV),]
```

```{r}
Class_summary_tidy <- AutoClaims %>% group_by(CLASS) %>%
                         summarize(Mean = mean(PAID),
                                   SD   = sd(PAID)) %>%
                         mutate(CV = Mean/SD) %>%
                         arrange(CV)

```  

```{r}
Class_summary_tidy
```




Class_mean<-aggregate(PAID~CLASS,data = AutoClaims,FUN = mean)
names(Class_mean)<-c("Class","Mean")
Class_sd<-aggregate(PAID~CLASS,data = AutoClaims,FUN = sd)
names(Class_sd)<-c("Class","SD")
Class_summary<-merge(Class_mean,Class_sd)
Class_summary$CV<-Class_summary$SD/Class_summary$Mean
#Mean, Standard Deviation and Coefficient of variance for each rating class
Class_summary


```{r}
Class_summary[order(Class_summary$CV),]
```



options(repr.plot.width=12, repr.plot.height=8)


boxplot(PAID~STATE,data = AutoClaims)


boxplot(PAID~CLASS,data = AutoClaims)



library(ggplot2)

p <- ggplot(data=AutoClaims,aes(x=STATE,y=PAID)) + geom_boxplot()

p



p <- ggplot(data=AutoClaims,aes(x=CLASS,y=PAID)) + geom_boxplot() 

p + theme_bw()




