tail(ames)
require(neuralnet)

set.seed(1)
neuralnet(PRICE~.,data = ames, hidden = 1, act.fct = "tanh")->LOGCABIN
plot(LOGCABIN)

data.frame(ROOMS=.7, BATHS=.3, KITCHENS=.1, CARS=.2)->NEST

predict(LOGCABIN, NEST)*1000000

data.frame(ROOMS=.9, BATHS=.4, KITCHENS=.1, CARS=.2)->FAIR

predict(LOGCABIN, FAIR)*1000000

set.seed(28)
neuralnet(REVENUE~., data = HOLLYWOOD, hidden = 1, act.fct = "logistic")->POPCORN
plot(MOVIES)

