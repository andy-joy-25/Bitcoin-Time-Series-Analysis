
filepath = "D:/AID-555 Files R/BTCUSD.csv"
bitcoin_data = read.csv("D:/AID-555 Files R/BTCUSD.csv",header = TRUE)

bitcoin_data$Date = as.Date(bitcoin_data$Date, format = '%d-%m-%Y')


library(FinTS)

ArchTest(bitcoin_data$Adj.Close)


library(rugarch)

spec = ugarchspec(mean.model = list(armaOrder = c(0,0)), variance.model = list(garchOrder = c(1,1)))

fit = ugarchfit(spec,data = diff(bitcoin_data$Adj.Close)) #Differencing for inducing Stationarity
fit


residuals = as.numeric(residuals(fit))
plot(bitcoin_data$Date[2:length(bitcoin_data$Date)],residuals,type = 'l',col = 'blue',xaxt = 'n',xlab = 'Time',ylab = 'Residuals')
axis.Date(1,at = seq(bitcoin_data$Date[2],bitcoin_data$Date[length(bitcoin_data$Date)],by = 'month'),format = '%m/%Y',las = 1)


