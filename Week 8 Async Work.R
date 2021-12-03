require(caret)

tail(HOME1)
tail(HOME2)

set.seed(13)
train(DEFAULT~., HOME1,method="knn", preProcess=c("center","scale"), tuneLength = 20) -> HGTV
HGTV  

predict(HGTV, HOME2) -> PROPERTYBROTHERS

train(DEFAULT~., HOME1,method="bayesglm") -> DIY
DIY
summary(DIY)

confusionMatrix(predict(HGTV, HOME2), HOME2[,1])
confusionMatrix(predict(DIY, HOME2), HOME2[,1])

PIGGY <- train(STATUS~., data = bank1, method="bayesglm")
piggy <- predict(PIGGY, bank2)

confusionMatrix(piggy, bank2$STATUS)

MY.COMPANY <- data.frame(X1= 0.4, X2 = 0.05, X3 = -0.01, X4 = -.02, X5 = 0.3, X6=-0.06, X7 = 0.1)
predict(PIGGY, MY.COMPANY, type = "prob")
