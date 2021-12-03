library(caret)
tail(CRED2)


train(DEFAULT~., data=CRED1, method="knn", preProcess=c("center","scale"), tuneLength=25) -> CARD
CARD

data.frame(LIMIT=25000, DEBT=14000,GENDER="Female", COLLEGE="Yes",
           MARITAL="Single", AGE=31,LATE=1) -> JANEDOE

predict(CARD, JANEDOE)

predict(CARD,CRED2) -> card
tail(card)

confusionMatrix(card, CRED2$DEFAULT)