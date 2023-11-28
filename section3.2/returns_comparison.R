library(quantmod)
library(fitdistrplus)
library(logspline)
library(extraDistr)

getSymbols("BTC-USD", src = "yahoo", from = Sys.Date()-365*2, to = Sys.Date())
btc <- Cl(`BTC-USD`)
getSymbols("ETH-USD", src = "yahoo", from = Sys.Date()-365*2, to = Sys.Date())
eth <- Cl(`ETH-USD`)

weekly_returns_btc <- weeklyReturn(btc, type="log")
weekly_returns_vector_btc <- as.numeric(coredata(weekly_returns))
weekly_returns_eth <- weeklyReturn(eth, type="log")
weekly_returns_vector_eth <- as.numeric(coredata(weekly_returns))

fl_btc <- fitdist(weekly_returns_vector_btc, "logis")
fn_eth <- fitdist(weekly_returns_vector_eth, "norm")

returns <- c(0.05, 0.10, 0.15, 0.20)

p_return_greater_btc <- 1 - plogis(returns, location = fl_btc$estimate['location'], scale = fl_btc$estimate['scale'])
p_return_greater_eth <- 1 - pnorm(returns, mean = fn_eth$estimate['mean'], sd = fn_eth$estimate['sd'])

print("Probabilidad de obtener un retorno mayor al 5%, 10%, 15% y 20% para Bitcoin, respectivamente: ")
print(p_return_greater_btc)
print("Probabilidad de obtener un retorno mayor al 5%, 10%, 15% y 20% para Ethereum:, respectivamente: ")
print(p_return_greater_eth)

returns <- c(-0.05, -0.10, -0.15, -0.20, -0.25)

p_return_less_btc <- plogis(returns, location = fl_btc$estimate['location'], scale = fl_btc$estimate['scale'])
p_return_less_eth <- pnorm(returns, mean = fn$estimate['mean'], sd = fn$estimate['sd'])

print("Probabilidad de obtener un retorno menor a -5%, -10%, -15%, -20% y -25% para Bitcoin, respectivamente: ")
print(p_return_less_btc)
print("Probabilidad de obtener un retorno menor a -5%, -10%, -15%, -20% y -25% para Ethereum, respectivamente: ")
print(p_return_less_eth)

  
  