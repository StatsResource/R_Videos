
set.seed(12345); 

y = arima.sim( list(order = c(1,1,0), ar = 0.7), n = 300)


ts.plot( y, 
        
        xlab = "Time", 
  
        ylab = "Simulated Values from an ARIMA(1,1,0) Time Series")

plot( y, 
  
      xlab = "Time", 
  
      ylab = "Simulated Values from an ARIMA(1,1,0) Time Series")


x <- 1:301

plot(x, y, 
     
     type="l", 
     
     xlab = "Time", 
  
     ylab = "Simulated Values from an ARIMA(1,1,0) Time Series")



x = 1:301
leastsquaresfit = lm(y~x)
leastsquaresfit$coefficients


abline(leastsquaresfit)

# OR:

lines(leastsquaresfit$fitted.values) 
  
########

plot(leastsquaresfit$res, xlab = "Time", ylab="Residuals")

 
acf(leastsquaresfit$res)



acf(y, xlab = "Lag", ylab = "ACF of Simulated Values from an ARIMA(1,1,0) Time Series", main = "ACF")

pacf(y, xlab = "Lag", ylab = "Partial ACF of Simulated Values from an ARIMA(1,1,0) Time Series", main = "PACF")


##########


#### Question 4


library(forecast)
tsdisplay(diff(y))



layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
ts.plot(diff(y), main = "diff(y)")
points(diff(y),cex=0.4)
acf(diff(y))
pacf(diff(y))

#######################

fit10=arima(diff(y),order = c(1,0,0));
fit10







fit11=arima(diff(y),order= c(1,0,1));fit11$aic
# 844.452
fit10=arima(diff(y),order= c(1,0,0));fit10$aic
# 842.4563
fit01=arima(diff(y),order= c(0,0,1));fit01$aic
# 911.0564
fit21=arima(diff(y),order= c(2,0,1));fit21$aic
# 845.8664
fit12=arima(diff(y),order= c(1,0,2));fit12$aic
# 846.3837
fit22=arima(diff(y),order= c(2,0,2));fit22$aic
# 847.6294


