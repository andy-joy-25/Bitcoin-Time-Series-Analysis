filepath = "D:/AID-555 Files R/BTCUSD.csv"
bitcoin_data = read.csv("D:/AID-555 Files R/BTCUSD.csv",header = TRUE)

bitcoin_data$Date = as.Date(bitcoin_data$Date, format = '%d-%m-%Y')

library(tseries)
bitcoin_TS = ts(bitcoin_data$Adj.Close,start = min(bitcoin_data$Date),end=max(bitcoin_data$Date))
plot(bitcoin_TS,xaxt = 'n',main = 'Bitcoin Daily data',xlab = 'Time',ylab='Adjusted Closing Price')
axis.Date(1,at = seq(bitcoin_data$Date[1],bitcoin_data$Date[length(bitcoin_data$Date)],by = 'month'),format = '%m/%Y',las = 1)

lr_model = lm(bitcoin_data$Adj.Close~bitcoin_data$Date)
summary(lr_model)
abline(lr_model,col = 'red')

adf.test(bitcoin_TS)

bitcoin_TS_d1 = diff(bitcoin_TS)

adf.test(bitcoin_TS_d1)

acf(bitcoin_TS)
pacf(bitcoin_TS)

library(forecast)
bitcoin_model = auto.arima(bitcoin_TS,ic='aic',trace=TRUE,stepwise = FALSE)

plot(bitcoin_model$x,col = 'blue',type = 'l',xaxt = 'n',xlab = 'Time',ylab='Adjusted Closing Price')
lines(bitcoin_model$fitted,col = 'red')
axis.Date(1,at = seq(bitcoin_data$Date[1],bitcoin_data$Date[length(bitcoin_data$Date)],by = 'month'),format = '%m/%Y',las = 1)
legend('topleft',legend = c('Actual','Fitted'),col = c('blue','red'),lty = 1)

fr_1_step_ahead = forecast(bitcoin_model,level=c(95),h=1)
plot(fr_1_step_ahead,xaxt = 'n',xlab = 'Time',ylab='Adjusted Closing Price')
axis.Date(1,at = seq(bitcoin_data$Date[1],bitcoin_data$Date[length(bitcoin_data$Date)],by = 'month'),format = '%m/%Y',las = 1)

