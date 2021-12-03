library(neuralnet)
head(MOVIES)

set.seed(9)
neuralnet(REVENUE~., data=MOVIES, hidden=3, act.fct = "logistic") -> ONE
plot(ONE)

set.seed(9)
neuralnet(REVENUE~., data=MOVIES, hidden=c(3,2), act.fct = "logistic") -> TWO
plot(TWO)

head(FILMS)

predict(ONE, FILMS) -> one
predict(TWO, FILMS) -> two

cor(one, FILMS$REVENUE)
cor(two, FILMS$REVENUE)

data.frame( RUNTIME=1.7 , BUDGET=0.0015 , ADVENTURE=0 , ACTION=0 , COMEDY=0 , DRAMA=0 , HORROR=1 , SCIFI=0 , ENGLISH=1 ) -> INSIDIOUS
INSIDIOUS
predict( ONE , INSIDIOUS )
predict( TWO , INSIDIOUS )

