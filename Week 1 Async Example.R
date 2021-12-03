require(quantmod)
require(PerformanceAnalytics)
#Gets the data from yahoo about Starbucks
getSymbols("SBUX", from = "2000-01-01", to = "2020-01-01")
head(SBUX)
coffee<- monthlyReturn(SBUX$SBUX.Adjusted)
round(head(coffee),3)
chart.Histogram(coffee, color="black")
valueAtRisk <- quantile(coffee,.05)
MostLikelyPercent <- mean(coffee[coffee<quantile(valueAtRisk)])
MostLikelyPercent
