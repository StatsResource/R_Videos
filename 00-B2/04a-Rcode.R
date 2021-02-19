getwd()

data <- read.csv("Speedboat_Sales.csv")

list.files()

install.packages("forecast")
library(forecast)
##############################################
library(forecast)

data <- read.csv("Speedboat_Sales.csv")

data

data = ts(data[,2],start = c(2005,1),frequency = 12)
plot(data, xlab='Years', ylab = 'Speedboat Sales')

par(mfrow = c(1,2))
acf(ts(data),main='ACF Speedboat Sales')
pacf(ts(data),main='PACF Speedboat Sales')


par(mfrow = c(1,1))
diff_data = diff(data)
plot(diff_data,ylab='Differenced Speedboat Sales')


diff_data_2 = diff(diff_data)
plot(diff_data_2,ylab='Differenced Speedboat Sales')


Log_data = log10(data)
plot(Log_data,ylab='Log Speedboat Sales')

Diff_log_data = diff(Log_data)
plot(Diff_log_data,ylab="Difference Log Speedboat Sales")


par(mfrow = c(1,2))
acf(ts(Diff_log_data),main="ACF Speedboat Sales")
pacf(ts(Diff_log_data),main="PACF Speedboat Sales")

ARIMAfit = auto.arima(Log_data,approximation=FALSE,trace=FALSE)

summary(ARIMAfit)



par(mfrow = c(1,1))
pred = predict(ARIMAfit, n.ahead = 36)
pred



plot(data,type='l',xlim=c(2006,2020),ylim=c(1,1600),xlab = 'Year',ylab = 'Speedboat Sales')
lines(10^(pred$pred),col='blue')
lines(10^(pred$pred+2*pred$se),col='orange')
lines(10^(pred$pred-2*pred$se),col='Brown')


par(mfrow=c(1,2))
acf(ts(ARIMAfit$residuals),main='ACF Residual')
pacf(ts(ARIMAfit$residuals),main='PACF Residual')

