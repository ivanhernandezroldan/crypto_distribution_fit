library(quantmod)
library(fitdistrplus)
library(logspline)
library(extraDistr)

getSymbols("BTC-USD", src = "yahoo", from = Sys.Date()-365*2, to = Sys.Date())
btc <- Cl(`BTC-USD`)

weekly_returns <- weeklyReturn(btc, type="log")
weekly_returns_vector <- as.numeric(coredata(weekly_returns))

df <- data.frame(Returns = weekly_returns_vector)
ggplot(df, aes(x=Returns)) +
  geom_density(alpha=0.5, fill="green") +
  theme_minimal() +
  labs(title="Retornos Semanales de Bitcoin", x="Retornos Semanales", y="Densidad") +
  theme(plot.title = element_text(hjust = 0.5)) 

descdist(weekly_returns_vector, discrete = FALSE, method = "sample")

fn <- fitdist(weekly_returns_vector, "norm")
fl <- fitdist(weekly_returns_vector, "logis")

summary(fn)
summary(fl)

plot.legend <- c("Normal", "Logística")
denscomp(list(fn, fl), legendtext = plot.legend)
cdfcomp(list(fn, fl), legendtext = plot.legend)
qqcomp(list(fn, fl), legendtext = plot.legend)
ppcomp(list(fn, fl), legendtext = plot.legend)
    
    
    