# #Get the insight into the dataset. Remove the missing values.
# path <- "C:/Users/Aditya/Desktop/Somaiya Stuff/SY/SEM 4/ADS/Datasets/Auto.csv"
# content <- read.csv(path)
# print(content)
# str(content)
# names(content)
# dim(content)
# head(content)
# summary(content)

# #Detect outliers and remove outliers
# boxplot(content$mpg)

# q <- quantile(na.omit(content$horsepower))
# q
# iqr<-IQR(content$horsepower)
# iqr

# up<-q[2]+1.5*iqr
# up
# low<-q[1]-1.5*iqr
# low

# #Elimanting outliers 
# outliers<-content[content$horsepower<=up & content$horsepower>=low]
# # outliers<-content[content$horsepower>low,]
# boxplot(outliers$horsepower)


# #Pearson Coeff
# cor(content$horespower, content$mpg)

# #Spearman Coeff
# cor(content$horespower, content$mpg, method = "spearman")

# #chi square test
# chisq.test(content$mpg, content$horsepower)

# #plotting 
# plot(content$mpg, content$horsepower, main = "Scatterplot", xlab = "mpg", ylab = "horsepower", pch = 19, col = "blue")


# Load the iris dataset
data(iris)

# View the first six rows of the dataset
head(iris)

# View the summary of the dataset
summary(iris)

# View the structure of the dataset
str(iris)

# Check for missing values
sum(is.na(iris))

# There are no missing values in the iris dataset

# Boxplot for the sepal length variable
boxplot(iris$Sepal.Length)

# Identify the outliers using the boxplot
boxplot.stats(iris$Sepal.Length)$out

# Remove the outliers from the dataset
iris <- iris[iris$Sepal.Length < 4.8,]

# Histogram for the sepal length variable
hist(iris$Sepal.Length)

# Density plot for the sepal length variable
plot(density(iris$Sepal.Length))

# Summary statistics for the sepal length variable
summary(iris$Sepal.Length)

# Pairwise scatter plot for the variables
pairs(iris)

# Pearson correlation coefficient
cor(iris[,1:4], method = "pearson")

# Spearman rank correlation coefficient
cor(iris[,1:4], method = "spearman")

# Chi-square test for the species and petal width variables
chisq.test(table(iris$Species, iris$Petal.Width))
