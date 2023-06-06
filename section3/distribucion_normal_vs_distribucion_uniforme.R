install.packages("ggplot2")

library(ggplot2)

citation("ggplot2")


set.seed(123) 

normal_data <- rnorm(100000, mean=0, sd=1)
uniform_data <- runif(100000, min=-sqrt(3), max=sqrt(3))

normal_df <- data.frame(Value = normal_data, Distribution = "Normal")
uniform_df <- data.frame(Value = uniform_data, Distribution = "Uniforme")

names(normal_df)
names(uniform_df)

combined_df <- rbind(normal_df, uniform_df)

ggplot(combined_df, aes(x=Value, fill=Distribution)) +
  geom_density(alpha=0.5) +
  theme_minimal() +
  labs(title="Distribución Normal vs Distribución Uniforme", x="Valor", y="Densidad", fill="Distribución") +
  scale_fill_manual(values = c("Normal" = "blue", "Uniforme" = "red")) +
  theme(legend.position = c(.85, .85), 
        plot.title = element_text(hjust = 0.5))
  

