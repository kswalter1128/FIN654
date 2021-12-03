require(caret)

#Use R and build a KNN Model that predicts the class of a raw food item.
FEAST <- train(CLASS~GI+CALORIES, data = FOOD, method = "knn", preProcess=c("center","scale"))
FEAST

tail(FOOD)

COCONUT <- data.frame(GI=53, CALORIES=369)
predict(FEAST, COCONUT)

Tests <- data.frame(ITEM=c("JALPENO","MACADEMIA","MANGO"),GI=c(30,10,51),CALORIES=c(29,705,60))
predict(FEAST, Tests) -> TestPrediction
Tests$Prediction <- TestPrediction
Tests

#Now use the Euro Data, train the model and run the dataset from 2 to predict is they're forged.
tail(EURO1)
tail(EURO2)

train(CLASS~VARIANCE+SKEWNESS+CURTOSIS+ENTROPY, data = EURO1, method="knn", preProcess = c("center","scale"), tuneLength=20) ->MONEY
MONEY
EUROTest <- predict(MONEY, EURO2)
EUROResults <- cbind(EUROTest, EURO2)
table(EURO2$CLASS, EUROTest)
confusionMatrix(EUROTest, EURO2$CLASS)

TestNote <- data.frame(VARIANCE = -2.97, SKEWNESS = -10.93, CURTOSIS = 8.78, ENTROPY = -2.11)
predict(MONEY, TestNote)
