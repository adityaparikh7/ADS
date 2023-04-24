# dataset <- read.csv("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/Datasets/Salary_Data.csv")
# print(dataset)
# library(caTools)
# set.seed(123)
# split <- sample.split(dataset$Salary, SplitRatio = 0.8)
# training_set <- subset(dataset, split == TRUE)
# test_set <- subset(dataset, split == FALSE)
# # Fitting Simple Linear Regression to the Training set
# regressor <- lm(
#     formula = Salary ~ YearsExperience,
#     data = training_set
# )
# # Predicting the Test set results
# y_pred <- predict(regressor, newdata = test_set)
# # Visualising the Training set results
# library(ggplot2)
# ggplot() +
#     geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), color = "red") +
#     geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), color = "blue") +
#     ggtitle("Salary vs Experience (Training set)") +
#     xlab("Years of Experience") +
#     ylab("Salary")


# dataset <- read.csv("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/Datasets/Salary_Data.csv")
# print(dataset)
# summary(dataset)
# library(ggplot2)
# ggplot(x = dataset$YearsExperience, y = dataset$Salary, color = "red") +
#     geom_point() +
#     ggtitle("Salary vs Experience") +
#     xlab("Years of Experience") +
#     ylab("Salary")
# model<-lm(target_variable ~ YearsExperience + Salary, data=dataset)
# library(caret)
# set.seed(123)
# trainIndex <- createDataPartition(dataset$target_variable, p=0.8, list=FALSE)
# trainData <- dataset[trainIndex, ]
# testData <- dataset[-trainIndex, ]
# model <- train(target_variable ~ ., data = trainData, method = "lm")
# model
# summary(model)
# plot(model)
# model$finalModel
# model$finalModel$coefficients




# Load the dataset
dataset <- read.csv("C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/Datasets/Salary_Data.csv")

# Print the dataset and summary
print(dataset)
summary(dataset)

# Build the linear model
model <- lm(Salary ~ YearsExperience, data=dataset)
summary(model)

# Plot the residuals
plot(model, which=1)

# Identify outliers
outliers <- which(abs(model$residuals) > 2*sd(model$residuals))

# Remove outliers and refit the model
salary_new <- dataset[-outliers,]
model_new <- lm(Salary ~ YearsExperience, data=salary_new)
summary(model_new)

# Create test dataset
test_data <- data.frame(YearsExperience=c(5, 10))

# Predict on test data
predictions <- predict(model_new, newdata=test_data)
print(predictions)

# Add predictions to original dataset
dataset$predicted <- predict(model_new, newdata=dataset)

# Plot predicted vs actual values
plot(dataset$YearsExperience, dataset$Salary, col="blue", 
     main="Predicted vs Actual Salary", xlab="Years of Experience", ylab="Salary")
points(dataset$YearsExperience, dataset$predicted, col="red")
legend("topright", legend=c("Actual Salary", "Predicted Salary"), col=c("blue", "red"), pch=1)
