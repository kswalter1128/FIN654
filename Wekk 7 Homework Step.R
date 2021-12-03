require(caret)

set.seed(13)
SHARK <- train(STATUS~., data = bank1, method="knn", preProcess=c("center","scale"), tuneLength = 20)

SHARK

shark <- predict(SHARK, bank2)

confusionMatrix(shark, bank2$STATUS)

MY.COMPANY <- data.frame(X1 = 0.4,
                         X2 = .05,
                         X3 = -.01,
                         X4 = -.02,
                         X5 = .3,
                         X6 = -.06,
                         X7= 0.1)
predict(SHARK, MY.COMPANY)
