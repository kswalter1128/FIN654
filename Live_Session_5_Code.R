names(EGGS) <- c("SBUX","TSLA")
head(EGGS)
library(PerformanceAnalytics)
Return.portfolio(EGGS, weights=c(0.7,0.3), geometric=T, wealth.index = T) -> ONE.BUCK
head(ONE.BUCK)
tail(ONE.BUCK)

Return.portfolio(EGGS, weights=c(0.7,0.3), geometric=F) -> SBUX70
mean(SBUX70) - .0002
#Risk premium is the expected reward for taking risk
Return.portfolio(EGGS, weights=c(0.1,0.9), geometric=F) -> SBUX10
mean(SBUX10) - 0.0002

sd(SBUX70)
sd(SBUX10)

library(highcharter)
hchart(SBUX70, name="70% SBUX" , color="green") %>% 
  hc_add_series(SBUX10, name="10% SBUX" , color="pink")

SharpeRatio(SBUX10, rf=.0002)
SharpeRatio(SBUX70, rf=.0002)
