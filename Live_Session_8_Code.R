tail(EURO1)

tail(EURO2)

library(caret)

train(CLASS ~ . , data=EURO1 , method="bayesglm") -> DOUGH

summary(DOUGH)



data.frame(VARIANCE=-0.17 , SKEWNESS=-10.93 , CURTOSIS=9.78 , ENTROPY=-2.11)  -> MONEY

predict(DOUGH , MONEY , type="prob")

predict(DOUGH , EURO2) -> GUESS

confusionMatrix(GUESS , EURO2$CLASS)