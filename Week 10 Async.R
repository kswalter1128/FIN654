#Review 10.1
plot(CELEB$AGE,CELEB$USD, xlab = "Age (2016)", ylab = "Income ($Million)")

require(scatterD3)
scatterD3(CELEB$AGE, CELEB$USD, xlab = "Age (2016)", ylab = "Income ($Million)", colors = "orange", hover_size = 10)

#Neuralnet 10.2
library(neuralnet)
set.seed(99)
neuralnet(PRICE~., data = NASH1, hidden = 4, act.fct="logistic")->MANCAVE

plot(MANCAVE)

mancave<- predict(MANCAVE, NASH2) 

lm(PRICE~.,data = NASH1)->SHESHED
SHESHED

sheshed <- predict(SHESHED, NASH2)

cor(mancave,NASH2$PRICE)
cor(sheshed, NASH2$PRICE)

FORSALE <- data.frame(ACRES = .19/10, AREA =1566/1000 ,YEAR=1984/1000 ,BATHS=4/10 , BRICK=1 , BASEMENT=0)
FORSALE

predict(MANCAVE, FORSALE)*1000000
predict(SHESHED, FORSALE)*1000000

#Deep Learning 10.3
set.seed(5)
LOWBUDGE<- neuralnet(REVENUE~., data = HOLLYWOOD, act.fct = "logistic", hidden = 3)
plot(LOWBUDGE)

set.seed(3)
BLOCKBUSTER <- neuralnet(REVENUE~., data = HOLLYWOOD, act.fct = "logistic", hidden = c(3,2))
plot(BLOCKBUSTER)

lowbudget<- predict(LOWBUDGE, WALKOFFAME)
blockbuster <- predict(BLOCKBUSTER, WALKOFFAME)
cor(lowbudget,WALKOFFAME$REVENUE)
cor(blockbuster,WALKOFFAME$REVENUE)

data.frame(BUDGET=0.027, RUNTIME=1.6, HORROR = 0, R.RATED=0)->GRISWALD
GRISWALD
predict(LOWBUDGE, GRISWALD)
predict(BLOCKBUSTER, GRISWALD)

data.frame(BUDGET=0.035, RUNTIME=126/60, HORROR = 0, R.RATED=0)->EXAMPLE2
EXAMPLE2
predict(LOWBUDGE, EXAMPLE2)
predict(BLOCKBUSTER, EXAMPLE2)