library(quantmod)
library(fitdistrplus)
library(logspline)
library(extraDistr)

getSymbols("ETH-USD", src = "yahoo", from = Sys.Date()-365*2, to = Sys.Date())
eth <- Cl(`ETH-USD`)

weekly_returns <- weeklyReturn(eth, type="log")
weekly_returns_vector <- as.numeric(coredata(weekly_returns))

df <- data.frame(Returns = weekly_returns_vector)
ggplot(df, aes(x=Returns)) +
  geom_density(alpha=0.5, fill="green") +
  theme_minimal() +
  labs(title="Retornos Semanales de Ethereum", x="Retornos Semanales", y="Densidad") +
  theme(plot.title = element_text(hjust = 0.5)) 

descdist(weekly_returns_vector, discrete = FALSE, method = "sample")

min_return <- min(weekly_returns_vector)

if (min_return < 0) {
  weekly_returns_vector <- weekly_returns_vector + abs(min_return) + 0.01
}

fn <- fitdist(weekly_returns_vector, "norm")
fln <- fitdist(weekly_returns_vector, "lnorm")
fg <- fitdist(weekly_returns_vector, "gamma")
fb <- fitdist(weekly_returns_vector, "beta")

summary(fn)
summary(fln)
summary(fg)
summary(fb)

plot.legend <- c("Normal", "Log-Normal", "Gamma", "Beta")
denscomp(list(fn, fln, fg, fb), legendtext = plot.legend)
cdfcomp(list(fn, fln, fg, fb), legendtext = plot.legend)
qqcomp(list(fn, fln, fg, fb), legendtext = plot.legend)
ppcomp(list(fn, fln, fg, fb), legendtext = plot.legend)
    
  
  

