install.packages("quantmod")

library(quantmod)
library(ggplot2)

getSymbols("BTC-USD", src = "yahoo", from = Sys.Date()-365*2, to = Sys.Date())
btc <- Cl(`BTC-USD`)

daily_returns <- dailyReturn(btc, type="log")
weekly_returns <- weeklyReturn(btc, type="log")
monthly_returns <- monthlyReturn(btc, type="log")

daily_df <- data.frame(Returns = coredata(daily_returns))
names(daily_df)[1] <- "Returns"
daily_df$Period <- "Diario"

weekly_df <- data.frame(Returns = coredata(weekly_returns))
names(weekly_df)[1] <- "Returns"
weekly_df$Period <- "Semanal"

monthly_df <- data.frame(Returns = coredata(monthly_returns))
names(monthly_df)[1] <- "Returns"
monthly_df$Period <- "Mensual"

combined_df <- rbind(daily_df, weekly_df, monthly_df)
combined_df$Period <- factor(combined_df$Period, levels = c("Diario", "Semanal", "Mensual"))

ggplot(combined_df, aes(x=Returns, fill=Period)) +
  geom_density(alpha=0.5) +
  theme_minimal() +
  labs(title="Retornos de Bitcoin según el Horizonte Temporal Analizado", x="Retornos", y="Densidad", fill="Periodo") +
  theme(legend.position = c(.85, .85), 
        plot.title = element_text(hjust = 0.5)) 

citation("ggplot2")
  
