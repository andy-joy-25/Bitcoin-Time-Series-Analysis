# Bitcoin-Time-Series-Analysis

Assignment for the course AID-555: Time Series Data Analysis at IIT Roorkee

**Statistical Analysis of the Bitcoin USD Data from Nov. 2020 to Nov. 2021 downloaded from [Yahoo!Finance](https://finance.yahoo.com/quote/BTC-USD/history?p=BTC-USD)**

## Trend

![image](https://user-images.githubusercontent.com/79297451/206381035-227bb0e6-f6f1-494b-90d1-74ae8e566725.png)

The trend line seemed to suggest that the **trend of the Adjusted Closing Price of Bitcoin was roughly an increasing one with time**.

## ARIMA(0,1,0) Model

After analysing the ACF and PACF plots, testing for stationarity using the ADF test and also, cross verifying empirically obtained conclusions with those obtained by using AIC, **an ARIMA(0,1,0) model without drift** was finally selected for the bitcoin time series, i.e., the bitcoin time series, to the best possible approximation obeyed the following equation: Δ𝑦<sub>𝑡</sub> = 𝑢<sub>𝑡</sub> [or, 𝑦<sub>𝑡</sub> − 𝑦<sub>𝑡−1</sub> = 𝑢<sub>𝑡</sub>] which was clearly, a **Random Walk** model! 

Thus, it was confirmed that the **Adjusted Closing Price of Bitcoin followed a Random/Stochastic behaviour**; in line with the initial observation of randomness from its time series plot. 

![image](https://user-images.githubusercontent.com/79297451/206381694-d993ef78-4ed1-4b49-8db0-20a4c81a193a.png)

Clearly, the difference between the actual and the fitted values was very low. Thus, the ARIMA(0,1,0) model without drift was a very good fit to the Adjusted Closing Price data

## Residuals of the Fitted GARCH Model

![image](https://user-images.githubusercontent.com/79297451/206382098-de5a53a7-714c-4e23-9978-b539d325218a.png)

Clearly, a high amount of volatility (variance) could be seen in the values of the residuals which essentially, translated to a high amount of volatility in the original data Δ𝑦<sub>𝑡</sub> since, here the residuals: 𝑢<sub>𝑡</sub> = Δ𝑦<sub>𝑡</sub> − 𝜇. 

As is characteristic of financial time series data, the time series of the Adjusted Closing Prices of Bitcoin exhibited volatility clustering: large (positive/negative) changes tended to follow large changes while small (positive/negative) changes tended to follow small changes. 

Thus, it could clearly be inferred that **Adjusted Closing Prices of Bitcoin were highly volatile, exhibited volatility clustering and this volatility was furthermore, persistent as well**.

