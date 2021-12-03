#Since we have xts objects, we need to open a package that utilizes xts objects.
library(PerformanceAnalytics)


#Let's inspect the data
tail(disney.monthly)
tail(no.risk)


#Let's compute the excess returns on DIS 
disney.monthly - no.risk -> disney.excess.monthly

tail(disney.excess.monthly)


#Let's compute the excess returns on the "U.S. Market"
market.monthly - no.risk -> market.excess.monthly


#Let's plot Disney's excess returns vs. the "U.S. Market's" excess returns:
chart.Regression(disney.excess.monthly , market.excess.monthly)


#Let's regress Disney's excess returns over the "U.S. Market's" excess returns:
lm(disney.excess.monthly ~ market.excess.monthly) -> mickey

abline(mickey)

mickey