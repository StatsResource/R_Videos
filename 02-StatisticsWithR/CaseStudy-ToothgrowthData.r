
#look at ToothGrowth data
str(ToothGrowth)



unique(ToothGrowth$dose)
## [1] 0.5 1.0 2.0

library(ggplot2)
#bar plot of counts of dose by supp
#data are balanced, so not so interesting
ggplot(ToothGrowth, aes(x=dose, fill=supp)) +  geom_bar()


#density of len
ggplot(ToothGrowth, aes(x=len))  + geom_density()



library(ggplot2)
#density of len by supp
ggplot(ToothGrowth, aes(x=len, color=supp)) + 
  geom_density()



#not the best scatterplot
tp <- ggplot(ToothGrowth, aes(x=dose, y=len))
tp + geom_point()


#mean and cl of len at each dose
tp.1 <- tp + stat_summary(fun.data="mean_cl_normal")
tp.1



#add a line plot of means to see dose-len relationship
#maybe not linear
tp.2 <- tp.1 + stat_summary(fun.y="mean", geom="line")
tp.2


Does a third variable moderate the x-y relationship?

Does the dose-len relationship depend on supp? We can specify new global aesthetics in aes.



#all plots in tp.2 will now be colored by supp
tp.2 + aes(color=supp)


#create dose-squared variable
ToothGrowth$dosesq <- ToothGrowth$dose^2


lm2 <- lm(len ~ dose + dosesq*supp, data=ToothGrowth)
summary(lm2)$coef
##                 Estimate Std. Error    t value     Pr(>|t|)
## (Intercept)    0.7491667  2.7983895  0.2677135 7.899213e-01
## dose          30.1550000  5.2474684  5.7465806 4.114588e-07
## dosesq        -8.7238095  2.0402571 -4.2758383 7.640686e-05
## suppVC        -6.4783333  1.3762287 -4.7073088 1.739152e-05
## dosesq:suppVC  1.5876190  0.5770719  2.7511635 8.024694e-03




#create dataset with original data and diagnostic variables
lm2diag <- fortify(lm2)
#quick look
head(lm2diag)




#q-q plot of residuals and diagonal reference line
#geom_abline default aesthetics are yintercept=0 and slope=1
ggplot(lm2diag, aes(sample=.stdresid)) + 
  stat_qq() + 
  geom_abline()




### Linearity and Homoscedasticity: residuals vs fitted

We next assess the assumptions of homoscedescasticity and linear relationships between the outcome and predictors. A residuals vs fitted (predicted value) plot assesses both of these assmuptions.

An even spread of residuals around 0 suggests homoscedasticity, and a zero, flat slope for residuals against fitted suggests linearity of predictor effects.



We build our residuals vs fitted plot like so:

1. Start with a scatter plot of x=.fitted and y=.stdresid.
2. Add a plot the means and standard errors of the residuals across fitted values using stat_summary. The standard error bars somewhat address homoskedasticity.
3. Plot a line representing the mean trend of the residuals with another call to stat_summary (changing function to mean and geom to line). Normally, we would use geom_smooth to plot a loess curve to visualize the trend among residuals, but loess smooths do not work well when the variable mapped to x is discrete.
4. The error bars do not appear to vary too much and the line seems sufficiently flat to feel that neither assumption has been violated.



#residual vs fitted, means and s.e.
ggplot(lm2diag, aes(x=.fitted, y=.stdresid)) + 
  geom_point() + 
  stat_summary() + 
  stat_summary(fun.y="mean", geom="line")
## No summary function supplied, defaulting to `mean_se()



# in geom_text we SET size to 4 so that size of text is constant,
#   and not tied to .cooksd.  We also  nudge the text .001 (x-axis units)
#   to the left, and separate overlapping labels
ggplot(lm2diag, aes(x=.hat, y=.stdresid, size=.cooksd)) +     
  geom_point() +
  geom_text(aes(label=row.names(lm2diag)), 
             size=4, nudge_x=-0.003, check_overlap=T)



