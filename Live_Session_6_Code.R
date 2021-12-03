library(quantmod)
library(fPortfolio)

#Let's convert the data into timeSeries format
as.timeSeries(stocks) -> STOCKS
head(STOCKS)

#Let's define the monthly risk-free rate
portfolioSpec() -> DESIGN
0.0002 -> setRiskFreeRate(DESIGN)
DESIGN

#Let's find the optimum portfolio with the maximum Sharpe Ratio
maxratioPortfolio(STOCKS, DESIGN) -> SHARPY
SHARPY

#Let's find the optimum portfolio with minimum volatility (risk)
minriskPortfolio( STOCKS )  ->  CALM
CALM

#Let's plot the frontier of portfolios
portfolioFrontier(STOCKS , DESIGN) -> BORDERLINE
plot(BORDERLINE)

#Let's set the number of frontier points to 1000 and re-build the frontier
1000 -> setNFrontierPoints(DESIGN)
portfolioFrontier(STOCKS , DESIGN) -> BORDERLINE
plot(BORDERLINE)

#
frontierPoints(BORDERLINE) -> COORDS
tail(COORDS)
getWeights(BORDERLINE) -> WEIGHTS
tail(WEIGHTS)
options(scipen=100)
cbind(COORDS,WEIGHTS) -> SHIPIT
write.csv(SHIPIT, file="frontier1000.csv")

