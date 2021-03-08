
The crabs data set
============================
The crabs data set is derived from Agresti (2007, Table 3.2, pp.76-77). It
gives 4 variables for each of 173 female horseshoe crabs.
    
* ***Satellites*** number of male partners in addition to the female's primary
partner
* ***Width*** width of the female in centimeters
* ***Dark*** a binary factor indicating whether the female has dark coloring
(yes or no)
* ***GoodSpine*** a binary factor indicating whether the female has good
spine condition (yes or no)


```R
require(glm2)
data(crabs)
head(crabs)
summary(crabs[,1:4])
```

    Loading required package: glm2



<table>
<thead><tr><th>Satellites</th><th>Width</th><th>Dark</th><th>GoodSpine</th><th>Rep1</th><th>Rep2</th></tr></thead>
<tbody>
	<tr><td>8   </td><td>28.3</td><td>no  </td><td>no  </td><td>2   </td><td>2   </td></tr>
	<tr><td>0   </td><td>22.5</td><td>yes </td><td>no  </td><td>4   </td><td>5   </td></tr>
	<tr><td>9   </td><td>26.0</td><td>no  </td><td>yes </td><td>5   </td><td>6   </td></tr>
	<tr><td>0   </td><td>24.8</td><td>yes </td><td>no  </td><td>6   </td><td>6   </td></tr>
	<tr><td>4   </td><td>26.0</td><td>yes </td><td>no  </td><td>6   </td><td>8   </td></tr>
	<tr><td>0   </td><td>23.8</td><td>no  </td><td>no  </td><td>8   </td><td>8   </td></tr>
</tbody>
</table>




       Satellites         Width       Dark     GoodSpine
     Min.   : 0.000   Min.   :21.0   no :107   no :121  
     1st Qu.: 0.000   1st Qu.:24.9   yes: 66   yes: 52  
     Median : 2.000   Median :26.1                      
     Mean   : 2.919   Mean   :26.3                      
     3rd Qu.: 5.000   3rd Qu.:27.7                      
     Max.   :15.000   Max.   :33.5                      



```R
head(crabs)
summary(crabs[,1:4])

```


<table>
<thead><tr><th>Satellites</th><th>Width</th><th>Dark</th><th>GoodSpine</th><th>Rep1</th><th>Rep2</th></tr></thead>
<tbody>
	<tr><td>8   </td><td>28.3</td><td>no  </td><td>no  </td><td>2   </td><td>2   </td></tr>
	<tr><td>0   </td><td>22.5</td><td>yes </td><td>no  </td><td>4   </td><td>5   </td></tr>
	<tr><td>9   </td><td>26.0</td><td>no  </td><td>yes </td><td>5   </td><td>6   </td></tr>
	<tr><td>0   </td><td>24.8</td><td>yes </td><td>no  </td><td>6   </td><td>6   </td></tr>
	<tr><td>4   </td><td>26.0</td><td>yes </td><td>no  </td><td>6   </td><td>8   </td></tr>
	<tr><td>0   </td><td>23.8</td><td>no  </td><td>no  </td><td>8   </td><td>8   </td></tr>
</tbody>
</table>




       Satellites         Width       Dark     GoodSpine
     Min.   : 0.000   Min.   :21.0   no :107   no :121  
     1st Qu.: 0.000   1st Qu.:24.9   yes: 66   yes: 52  
     Median : 2.000   Median :26.1                      
     Mean   : 2.919   Mean   :26.3                      
     3rd Qu.: 5.000   3rd Qu.:27.7                      
     Max.   :15.000   Max.   :33.5                      


#### Question 
Fit a Poisson regression model with the number of Satellites as the outcome
and the width of the female as the covariate. 

What is the multiplicative
change in the expected number of crabs for each additional centimeter of
width?



```R
crabs.pois <- glm2(Satellites ~ Width,
data=crabs, family="poisson")
summary(crabs.pois)

```


    
    Call:
    glm2(formula = Satellites ~ Width, family = "poisson", data = crabs)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -2.8526  -1.9884  -0.4933   1.0970   4.9221  
    
    Coefficients:
                Estimate Std. Error z value Pr(>|z|)    
    (Intercept) -3.30476    0.54224  -6.095  1.1e-09 ***
    Width        0.16405    0.01997   8.216  < 2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for poisson family taken to be 1)
    
        Null deviance: 632.79  on 172  degrees of freedom
    Residual deviance: 567.88  on 171  degrees of freedom
    AIC: 927.18
    
    Number of Fisher Scoring iterations: 6




```R
exp(-3.30476)*exp(0.164*25)

```


2.21497252642431



```R

plot(crabs$Width, crabs$Satellites,
     pch=16, col="darkred")
points(crabs$Width, crabs.pois$fitted.values, 
     col="green", type="p", lwd=3)

```


![png](output_6_0.png)



### Coursera Question 4
Given a set of parameters $\{\beta_0,\beta_1, \ldots, \beta_n\}$ and an input vector $x$ (i.e $\{x_1,x_2, \ldots x_n\}$), the mean of the predicted Poisson distribution is given by
$$\operatorname{E}(Y|x)=e^{\beta_0+\beta_1x_1 + \ldots + \beta_nx_n}\,
$$
In the case of one predictor variable, we can say
$$\operatorname{E}(Y|x)=e^{\beta_0+\beta_1x}=e^{\beta_0}\times e^{\beta_1x}\,$$

***Remark***: The expected value does not have to be an integer.





#### Question
What is the expected number of Satellites for a female of width 22cm?



```R
exp(-3.30476)*exp(0.16405*22)
```


1.35572992591217



```R

```
