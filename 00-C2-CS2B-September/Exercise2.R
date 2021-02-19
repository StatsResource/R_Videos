

Q2
(i)

```{r}
dpois(0:3, 2)
```
 0.1353353 0.2706706 0.2706706 0.1804470
1 - ppois(3, 2)
 0.1428765
OR:
1-sum(dpois(0:3, 2))
 0.1428765
So the probabilities are:
0
1
2
3
4+
0.1353
0.2707
0.2707
0.1804
0.1429


## Exercise 2
(ii) Determine a transition matrix for the number of passengers waiting at the exit
when a pod arrives.



(ii)
0 ï£® 0.1353
1 ï£¯ ï£¯ 0.1353
2 ï£¯ 0.1353
ï£¯
3 ï£¯ 0
4 + ï£¯ ï£° 0.1353
0.2707
0.2707
0.2707
0.1353
0.2707
0.2707
0.2707
0.2707
0.2707
0.2707
0.1804
0.1804
0.1804
0.2707
0.1804
0.1429 ï£¹
0.1429 ï£º ï£º
0.1429 ï£º
ï£º
0.3233 ï£º
0.1429 ï£º ï£»


## Exercise 3
(iii) Calculate the average number of times per hour that the company operating the
pods will need to summon a taxi to take passengers to the car park.

Passengers <- c("0", "1", "2", "3", "4+")
Passengers


PassMatrix <- matrix(c(0.1353, 0.2707, 0.2707, 0.1804, 0.1429, 
                       0.1353, 0.2707, 0.2707, 0.1804, 0.1429, 
                       0.1353, 0.2707, 0.2707, 0.1804, 0.1429, 
                       0, 0.1353, 0.2707, 0.2707, 0.3233, 
                       0.1353, 0.2707, 0.2707, 0.1804, 0.1429),
             nrow = 5, byrow = TRUE, 
             dimname = list(Passengers, Passengers))

PassMatrix


install.packages("markovchain") # if not installed




library(markovchain)

Airport <- new("markovchain", 
               states = Passengers, 
               byrow = TRUE, 
               transitionMatrix = PassMatrix, 
               name = "Passengers waiting")



Airport
Passengers waiting
A 5 - dimensional discrete Markov Chain defined by the
following states:
0, 1, 2, 3, 4+
The transition matrix (by rows) is defined as follows:
0
1
2
3
4+
0 0.1353 0.2707 0.2707 0.1804 0.1429
1 0.1353 0.2707 0.2707 0.1804 0.1429
2 0.1353 0.2707 0.2707 0.1804 0.1429
3 0.0000 0.1353 0.2707 0.2707 0.3233
4+ 0.1353 0.2707 0.2707 0.1804 0.1429

steadyStates(Airport)
0
1
2
3
4+
[1,] 0.108469 0.2438492 0.2707 0.1983071 0.1786746


So there will be four or more passengers waiting when 17.87 per cent of the pods
arrive.
Since there are 30 pods arriving per hour, a taxi will need to be summoned an
average of 5.36 times per hour.




OR:
Passengers <- c("0", "1", "2", "3", "4+")
Passengers
 "0" "1"
"2"
"3"
"4+"
PassMatrix <- matrix(c(0.1353, 0.2707, 0.2707, 0.1804,
0.1429, 0.1353, 0.2707, 0.2707, 0.1804, 0.1429, 0.1353,
0.2707, 0.2707, 0.1804, 0.1429, 0, 0.1353, 0.2707,
0.2707, 0.3233, 0.1353, 0.2707, 0.2707, 0.1804, 0.1429),
nrow = 5, byrow = T, dimname = list(Passengers,
Passengers))
PassMatrix
0
1
0 0.1353 0.2707
1 0.1353 0.2707
2 0.1353 0.2707
3 0.0000 0.1353






SteadyState <- diag(5)
for (i in 1:100){
SteadyState <- SteadyState %*% PassMatrix
}
SteadyState



So there will be four or more passengers waiting when 17.87 per cent of the pods arrive.

Since there are 30 pods arriving per hour, a taxi will need to be summoned an average of 5.36 times per hour.

dpois(0:3, 1.75) %>% round(3)

sum( dpois(0:3, 1.75) )




 0.1737739 0.3041044 0.2660914 0.1552200
1 - ppois(3, 1.75)
 0.1008103
OR:
1-sum(dpois(0:3, 1.75))
PassMatrix2 <- matrix(c(0.1738, 0.3041, 0.2661, 0.1552,
0.1008, 0.1738, 0.3041, 0.2661, 0.1552, 0.1008, 0.1738,
0.3041, 0.2661, 0.1552, 0.1008, 0, 0.1738, 0.3041,
0.2661, 0.2560, 0.1738, 0.3041, 0.2661, 0.1552, 0.1008),
nrow = 5, byrow = T, dimname = list(Passengers,
Passengers))
PassMatrix2


0
1
2
3
4+
0 0.1738 0.3041 0.2661 0.1552 0.1008
1 0.1738 0.3041 0.2661 0.1552 0.1008

@Institute and Faculty of Actuaries - 
2 0.1738 0.3041 0.2661 0.1552 0.1008
3 0.0000 0.1738 0.3041 0.2661 0.2560
4+ 0.1738 0.3041 0.2661 0.1552 0.1008

Airport2 <- new("markovchain", states = Passengers,
byrow = T, transitionMatrix = PassMatrix2, name =
"Passengers waiting")
Airport2
Passengers waiting
A 5 - dimensional discrete Markov Chain defined by the
following states:
0, 1, 2, 3, 4+
The transition matrix (by rows) is defined as follows:
0
1
2
3
4+
0 0.1738 0.3041 0.2661 0.1552 0.1008
1 0.1738 0.3041 0.2661 0.1552 0.1008
2 0.1738 0.3041 0.2661 0.1552 0.1008
3 0.0000 0.1738 0.3041 0.2661 0.2560
4+ 0.1738 0.3041 0.2661 0.1552 0.1008



steadyStates(Airport2)
0
1
2
3
4+
[1,] 0.1434617 0.281355 0.2727332 0.1745585 0.1278915


Taxis will be needed when 12.79 per cent of the pods arrive.
There are 34.28 pods per hour, so 4.38 taxis per hour will be required.

OR:
dpois(0:3, 1.75)
 0.1737739 0.3041044 0.2660914 0.1552200
1 - ppois(3, 1.75)
 0.1008103
OR:
1-sum(dpois(0:3, 1.75))
PassMatrix2 <- matrix(c(0.1738, 0.3041, 0.2661, 0.1552,
0.1008, 0.1738, 0.3041, 0.2661, 0.1552, 0.1008, 0.1738,
0.3041, 0.2661, 0.1552, 0.1008, 0, 0.1738, 0.3041,
0.2661, 0.2560, 0.1738, 0.3041, 0.2661, 0.1552, 0.1008),
nrow = 5, byrow = T, dimname = list(Passengers,
Passengers))

@Institute and Faculty of Actuaries - 
PassMatrix2
0
1
0 0.1738 0.3041
1 0.1738 0.3041
2 0.1738 0.3041
3 0.0000 0.1738
4+ 0.1738 0.3041
2
0.2661
0.2661
0.2661
0.3041
0.2661
3
0.1552
0.1552
0.1552
0.2661
0.1552
4+
0.1008
0.1008
0.1008
0.2560
0.1008
SteadyState2 <- diag(5)
for (i in 1:100){
SteadyState2 <- SteadyState2 %*%
}
SteadyState2
0
1
2
[1,] 0.1434617 0.281355 0.2727332
[2,] 0.1434617 0.281355 0.2727332
[3,] 0.1434617 0.281355 0.2727332
[4,] 0.1434617 0.281355 0.2727332
[5,] 0.1434617 0.281355 0.2727332

PassMatrix2
3
0.1745585
0.1745585
0.1745585
0.1745585
0.1745585
4+
0.1278915
0.1278915
0.1278915
0.1278915
0.1278915

Hence the steady states are:
0
1
2
3
4+
0.1434617 0.281355 0.2727332 0.1745585 0.1278915




