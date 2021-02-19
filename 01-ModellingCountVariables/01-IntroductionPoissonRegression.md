

```R
library(magrittr)
```


```R
Cavalry <- rpois(200,lambda=0.61)
```


```R
Cavalry
```


<ol class="list-inline">
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>2</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>3</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>2</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>2</li>
	<li>0</li>
	<li>2</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>2</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>2</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>3</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>2</li>
	<li>0</li>
	<li>2</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>2</li>
	<li>0</li>
	<li>2</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>3</li>
	<li>1</li>
	<li>0</li>
	<li>2</li>
	<li>1</li>
	<li>1</li>
	<li>2</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>2</li>
	<li>3</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>3</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>2</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>1</li>
	<li>0</li>
	<li>0</li>
	<li>1</li>
	<li>2</li>
	<li>0</li>
	<li>1</li>
</ol>




```R
mean(Cavalry);var(Cavalry)
```


0.61



0.540603015075377



```R
Cavalry <- rpois(2000,lambda=0.61)
```

### Dispersion Parameter


$$ \theta = \frac{Var(X)}{E(X)} \approx 1$$


```R
Theta <-  var(Cavalry)/mean(Cavalry)

Theta %>% round(3)
```


0.955


### Simulation Exercise


```R
Theta = numeric()
M = 100000

for ( i in 1:M){
   X=rpois(200,lambda=5);
   Theta[i] = var(X)/mean(X)
}

quantile(Theta, c(0.025,0.975))  %>% round(3)
```


<dl class="dl-horizontal">
	<dt>2.5%</dt>
		<dd>0.815</dd>
	<dt>97.5%</dt>
		<dd>1.207</dd>
</dl>




```R

```
