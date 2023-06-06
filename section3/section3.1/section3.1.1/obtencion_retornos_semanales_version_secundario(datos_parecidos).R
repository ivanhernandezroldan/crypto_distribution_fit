library(quantmod)
library(fitdistrplus)
library(logspline)
library(magrittr)

# Obtener los datos de los precios de cierre de Bitcoin de Yahoo Finance
getSymbols("BTC-USD", src = "yahoo", from = Sys.Date()-365*2, to = Sys.Date())
btc <- Cl(`BTC-USD`)

btc_weekly <- to.weekly(btc)[,4]
btc_weekly_returns <- Delt(btc_weekly, k = 1) %>% na.omit()

# Calcular los retornos logarítmicos semanales
#weekly_returns <- weeklyReturn(btc, type="log") #type - type of returns: arithmetic (discrete) or log (continuous)
# Convertir los retornos semanales en un vector numérico
weekly_returns_vector <- as.numeric(coredata(btc_weekly_returns))

df <- data.frame(Returns = weekly_returns_vector)
ggplot(df, aes(x=Returns)) +
  geom_density(alpha=0.5, fill="green") +
  theme_minimal() +
  labs(title="Retornos Semanales de Bitcoin", x="Retornos Semanales", y="Densidad") +
  theme(plot.title = element_text(hjust = 0.5)) 

# Usar los retornos logarítmicos semanales en lugar del vector 'x'
descdist(weekly_returns_vector, discrete = FALSE)



