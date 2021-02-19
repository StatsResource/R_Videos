
#sessionInfo()

apts <- ts(AirPassengers, frequency=12)

plot(apts)


acf(apts)

f <- decompose(apts)
plot(f)




fit <- arima(AirPassengers, order=c(1,0,0), list(order=c(2,1,0), period=12))
fit



class(fit)

summary(fit)

# "fore" for forecast

fore <- predict(fit, n.ahead=24)

fore

ts.plot(AirPassengers, fore$pred, U, L, 
        col=c(1,2,4,4), 
        lty = c(1,1,2,2))

legend("topleft", 
       c("Actual", "Forecast", "Error Bounds (95% Confidence)"),
       col=c(1,2,4), 
       lty=c(1,1,2))


