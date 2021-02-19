
### Logistic Regression

#### University Admissions Example
A researcher is interested in how variables, such as GRE (Graduate Record Exam scores), GPA (grade point average) and prestige of the undergraduate institution, effect admission into graduate school. 

The response variable, ***admit/don’t admit***, is a binary variable.



```R
Admis <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/ggplot2/SchoolAdmissions.csv")

# Same Data Set - with added statistical analysis

Admis2 <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/ggplot2/SchoolAdmissions2.csv")



```


```R
This dataset has a binary response (outcome, dependent) variable called admit. There are three predictor variables: gre, gpa and rank. We will treat the variables gre and gpa as continuous. The variable rank takes on the values 1 through 4. Institutions with a rank of 1 have the highest prestige, while those with a rank of 4 have the lowest. We can get basic descriptives for the entire data set by using summary.
    
```


```R
head(Admis)
```


<table>
<thead><tr><th>admit</th><th>gre</th><th>gpa</th><th>rank</th><th>rankP</th></tr></thead>
<tbody>
	<tr><td>0        </td><td>380      </td><td>3.61     </td><td>3        </td><td>0.1726265</td></tr>
	<tr><td>1        </td><td>660      </td><td>3.67     </td><td>3        </td><td>0.2921750</td></tr>
	<tr><td>1        </td><td>800      </td><td>4.00     </td><td>1        </td><td>0.7384082</td></tr>
	<tr><td>1        </td><td>640      </td><td>3.19     </td><td>4        </td><td>0.1783846</td></tr>
	<tr><td>0        </td><td>520      </td><td>2.93     </td><td>4        </td><td>0.1183539</td></tr>
	<tr><td>1        </td><td>760      </td><td>3.00     </td><td>2        </td><td>0.3699699</td></tr>
</tbody>
</table>




```R
summary(Admis)
```


         admit             gre             gpa             rank      
     Min.   :0.0000   Min.   :220.0   Min.   :2.260   Min.   :1.000  
     1st Qu.:0.0000   1st Qu.:520.0   1st Qu.:3.130   1st Qu.:2.000  
     Median :0.0000   Median :580.0   Median :3.395   Median :2.000  
     Mean   :0.3175   Mean   :587.7   Mean   :3.390   Mean   :2.485  
     3rd Qu.:1.0000   3rd Qu.:660.0   3rd Qu.:3.670   3rd Qu.:3.000  
     Max.   :1.0000   Max.   :800.0   Max.   :4.000   Max.   :4.000  
         rankP        
     Min.   :0.05879  
     1st Qu.:0.19543  
     Median :0.29799  
     Mean   :0.31750  
     3rd Qu.:0.40139  
     Max.   :0.73841  



```R
head(Admis2)
```


<table>
<thead><tr><th>admit</th><th>gre</th><th>gpa</th><th>rank</th><th>rankP</th><th>fit</th><th>se.fit</th><th>residual.scale</th><th>UL</th><th>LL</th><th>PredictedProb</th></tr></thead>
<tbody>
	<tr><td>0         </td><td>380       </td><td>3.61      </td><td>3         </td><td>0.1726265 </td><td>-1.5671256</td><td>0.3359675 </td><td>1         </td><td>0.2872804 </td><td>0.09747311</td><td>0.1726265 </td></tr>
	<tr><td>1         </td><td>660       </td><td>3.67      </td><td>3         </td><td>0.2921750 </td><td>-0.8848442</td><td>0.2297198 </td><td>1         </td><td>0.3930300 </td><td>0.20831785</td><td>0.2921750 </td></tr>
	<tr><td>1         </td><td>800       </td><td>4.00      </td><td>1         </td><td>0.7384082 </td><td> 1.0377118</td><td>0.3480671 </td><td>1         </td><td>0.8481189 </td><td>0.58795075</td><td>0.7384082 </td></tr>
	<tr><td>1         </td><td>640       </td><td>3.19      </td><td>4         </td><td>0.1783846 </td><td>-1.5273305</td><td>0.3373684 </td><td>1         </td><td>0.2960689 </td><td>0.10078138</td><td>0.1783846 </td></tr>
	<tr><td>0         </td><td>520       </td><td>2.93      </td><td>4         </td><td>0.1183539 </td><td>-2.0081113</td><td>0.3552036 </td><td>1         </td><td>0.2121670 </td><td>0.06271949</td><td>0.1183539 </td></tr>
	<tr><td>1         </td><td>760       </td><td>3.00      </td><td>2         </td><td>0.3699699 </td><td>-0.5323458</td><td>0.3023582 </td><td>1         </td><td>0.5150645 </td><td>0.24509097</td><td>0.3699699 </td></tr>
</tbody>
</table>




```R
library(ggplot2)
```


```R
ggplot(Admis2, aes(x = gre, y = PredictedProb))  + geom_point(aes(colour = factor(rank)))


```




![png](output_7_1.png)



```R
ggplot(Admis2, aes(x = gre, y = PredictedProb)) + geom_point(aes(colour = factor(rank))) + 
geom_smooth(aes(fill = rank), method="lm",  size = 1)
   
```




![png](output_8_1.png)



```R

```


```R

```
