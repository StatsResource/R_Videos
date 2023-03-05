

```R
### Robust Regression (Optional Section)}

Robust regression is an alternative to ordinary least squares regression (OLS , the type of regression we have studied thus far) when data is contaminated with outliers or influential observations and it can also be used for the purpose of detecting influential observations.

Some important terms in linear regression.
\begin{description}
* [Residual: ] The difference between the predicted value (based on the regression equation) and the actual, observed value.
* [Outlier:]  In linear regression, an outlier is an observation with large residual.  In other words, it is an observation whose dependent-variable value is unusual given its value on the predictor variables.  An outlier may indicate a sample peculiarity or may indicate a data entry error or other problem. 
* [Leverage:]  An observation with an extreme value on a predictor variable is a point with high leverage.  Leverage is a measure of how far an independent variable deviates from its mean.  High leverage points can have a great amount of effect on the estimate of regression coefficients. 
* [Influence:]  An observation is said to be influential if removing the observation substantially changes the estimate of the regression coefficients.  Influence can be thought of as the product of leverage and outlierness.  
* [Cook's distance (or Cook's D):] A measure that combines the information of leverage and residual of the observation.  
\end{description}
\begin{framed}
\begin{verbatim}
FitAll = lm(Taste ~ Acetic + H2S + Lactic)
plot(FitAll)
\end{verbatim}
\end{framed}
This will produce a set of four plots: residuals versus fitted values, a Q-Q plot of standardized residuals, a scale-location plot (square roots of standardized residuals versus fitted values, and a plot of residuals versus leverage that adds bands corresponding to Cook's distances of 0.5 and 1. 

Using the plot to get a detailed interpretation of how well the model fits is beyond the scope of this module. However it is worth noting that plots identify particular observations that may warrant re-examination. 





```


```R
\textbf{Remarks :} 
% OLD MA4605 Notes
The plots actually indicate the fitted model is actually quite good. The trend lines in the first and third plots demonstrate constant variance, and in the case of the first, the trend line through the centre of the plot  follows the X=0 line quite well.

The Q-Q plot (i.e. the second plot) indicates that the assumption of normality is vindicated.
The last plot indicates the no observations have unusually high Cook’s Distances values.  No observations are beyond the 0.5 (red line) threshold.

Robust regression is an alternative to least squares regression when data are contaminated with outliers or influential observations, and it can also be used for the purpose of detecting influential observation

% IMAGES HERE

Additionally I have added a line plot of the Cook’s Distance values. Which observations have the highest values for Cook’s Distance?


```


```R
plot(cooks.distance(FitAll),type="b",pch=18,col="red")

```


```R
### The stackloss data set
%
Brownlee's Stack Loss Plant Data contains operational data of a plant for the oxidation of ammonia to nitric acid.

The variables are: 

* 	Air Flow	 Flow of cooling air
* 	Water Temp	 Cooling Water Inlet Temperature
* 	Acid Conc.	 Concentration of acid [per 1000, minus 500]
* 	stack.loss	 Stack loss

```


```R


\subsection{Fitting a robust model (\texttt{rlm}}
%-------------------------------------%
\begin{framed}
\begin{verbatim}
summary(rlm(stack.loss ~ ., data = stackloss))
\end{verbatim}
\end{framed}
%-------------------------------------%
\begin{verbatim}
> summary(rlm(stack.loss ~ ., stackloss))

Call: rlm(formula = stack.loss ~ ., data = stackloss)
Residuals:
     Min       1Q   Median       3Q      Max 
-8.91753 -1.73127  0.06187  1.54306  6.50163 

Coefficients:
            Value    Std. Error t value 
(Intercept) -41.0265   9.8073    -4.1832
Air.Flow      0.8294   0.1112     7.4597
Water.Temp    0.9261   0.3034     3.0524
Acid.Conc.   -0.1278   0.1289    -0.9922

Residual standard error: 2.441 on 17 degrees of freedom
\end{verbatim}
%-------------------------------------%
\begin{framed}
\begin{verbatim}
 rlm(stack.loss ~ ., stackloss, psi = psi.hampel, init = "lts")
\end{verbatim}
\end{framed}
%-------------------------------------%
```


```R

\begin{verbatim}
> rlm(stack.loss ~ ., stackloss, psi = psi.hampel, init = "lts")
Call:
rlm(formula = stack.loss ~ ., data = stackloss, psi = psi.hampel, 
    init = "lts")
Converged in 10 iterations

Coefficients:
(Intercept)    Air.Flow  Water.Temp  Acid.Conc. 
-40.4748037   0.7410863   1.2250703  -0.1455242 

Degrees of freedom: 21 total; 17 residual
Scale estimate: 3.09 
\end{verbatim}
%-------------------------------------%
\subsection{Using Other \textit{Psi} Operators}

Fitting is done by \textbf{\emph{iterated re-weighted least squares (IWLS).}}

Psi functions are supplied for the Huber, Hampel and Tukey bisquare proposals as psi.huber, \texttt{psi.hampel} and \textbf{psi.bisquare}. Huber's corresponds to a convex optimization problem and gives a unique solution (up to collinearity). The other two will have multiple local minima, and a good starting point is desirable.




*  huber
*  bisquare
*  hampel



\begin{framed}
\begin{verbatim}
 rlm(stack.loss ~ ., stackloss, psi = psi.bisquare)
\end{verbatim}
\end{framed}
\begin{verbatim}
Call:
rlm(formula = stack.loss ~ ., data = stackloss, psi = psi.bisquare)
Converged in 11 iterations

Coefficients:
(Intercept)    Air.Flow  Water.Temp  Acid.Conc. 
-42.2852537   0.9275471   0.6507322  -0.1123310 

Degrees of freedom: 21 total; 17 residual
Scale estimate: 2.28 
\end{verbatim}


\subsection{Implementation of Robust Regression}

*  When fitting a least squares regression, we might find some outliers or high leverage data points.  We have decided that these data points are not data entry errors, neither they are from a different population than most of our data. So we have no proper reason to exclude them from the analysis.  

*  Robust regression might be a good strategy since it is a compromise between excluding these points entirely from the analysis and including all the data points and treating all them equally in OLS regression. The idea of robust regression is to weigh the observations differently based on how well behaved these observations are.



