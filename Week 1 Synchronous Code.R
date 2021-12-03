require(quantmod)
require(PerformanceAnalytics)
require(highcharter)
getSymbols("AIR.PA",from="2011-01-01", to="2021-01-01")
head(AIR.PA)
tail(AIR.PA)

cockpit <- monthlyReturn(AIR.PA$AIR.PA.Adjusted)

round(head(cockpit),3)
round(tail(cockpit),3)

#For visualization of the data. New Content not covered in async

#install.packages("highcharter")
hchart(hist(cockpit))

A220 <- quantile(cockpit, 0.05)
ExpectedShortFall <- mean(cockpit[cockpit<A220,])

?hchart
options(scipen = 999)


getSymbols("SBUX", from="2016-01-01",to="2021-01-01")
MOCHA<- monthlyReturn(SBUX$SBUX.Adjusted)
chart.Histogram(MOCHA)
hchart(hist(MOCHA))
TEA <- quantile(MOCHA, 0.05)
round(mean(MOCHA[MOCHA<TEA])*100,2)
