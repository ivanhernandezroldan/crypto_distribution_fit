media <- 0.01  
desviacion <- 0.02  
retorno_objetivo <- 0.05  

probabilidad_menor_igual <- pnorm(retorno_objetivo, mean = media, sd = desviacion)

probabilidad_mayor <- 1 - probabilidad_menor_igual

probabilidad_mayor
  
  
