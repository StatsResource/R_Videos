
Admis <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/ggplot2/SchoolAdmissions.csv")

# Same Data Set - with added statistical analysis

Admis2 <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/ggplot2/SchoolAdmissions2.csv")




This dataset has a binary response (outcome, dependent) variable called admit. There are three predictor variables: gre, gpa and rank. We will treat the variables gre and gpa as continuous. The variable rank takes on the values 1 through 4. Institutions with a rank of 1 have the highest prestige, while those with a rank of 4 have the lowest. We can get basic descriptives for the entire data set by using summary.
    

head(Admis)

summary(Admis)

head(Admis2)

library(ggplot2)

ggplot(Admis2, aes(x = gre, y = PredictedProb))  + geom_point(aes(colour = factor(rank)))



ggplot(Admis2, aes(x = gre, y = PredictedProb)) + geom_point(aes(colour = factor(rank))) + 
geom_smooth(aes(fill = rank), method="lm",  size = 1)
   




