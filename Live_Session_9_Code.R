tail(MOUNTAINS)

library(neuralnet)

set.seed(1)
neuralnet(PRICE~., data=MOUNTAINS, hidden=1, act.fct="logistic") -> COLORADO
plot(COLORADO)

data.frame(BEDS=0.2, BATHS=0.2, SQFT=0.0794, CONDO=1) -> FANCY
FANCY
predict(COLORADO,FANCY)*10000000

data.frame(BEDS=0.1, BATHS=0.1, SQFT=0.0770, CONDO=0) -> PRICY
predict(COLORADO,PRICY)
