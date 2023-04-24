path <- "C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/Datasets/seatbelts.csv"
content <- read.csv(path)
print(content)
summary(content)



path <- "C:/Users/andro/OneDrive/Desktop/Somaiya Stuff/SY/SEM 4/ADS/Datasets/Auto.csv"
content <- read.csv(path)
print(content)
summary(content)
mean(content$mpg)
median(content$mpg)
mode(content$mpg)
sd(content$mpg)
var(content$mpg)
range(content$mpg)
IQR(content$mpg)
quantile(content$mpg)
plot(content$mpg,content$weight)
boxplot(content$mpg)
barplot(content$mpg)
pie(content$mpg)
hist(content$mpg)
library(moments)
print(skewness(content$mpg))
print(kurtosis(content$mpg))




colnames(content)
mean(content$mpg)
median(content$mpg)
mode(content$mpg)
sd(content$mpg)
var(content$mpg)
min(content$mpg)
max(content$mpg)
range(content$mpg)
quantile(content$mpg)
quantile(content$mpg, 0.25)
quantile(content$mpg, 0.75)
quantile(content$mpg, 0.5)
quantile(content$mpg, 0.75) - quantile(content$mpg, 0.25)
IQR(content$mpg)

pie(content$mpg)


pie(x, labels = piepercent, main = "Horsepower pie chart",col = rainbow(length(x)))
legend("topright", cex = 0.8,
   fill = rainbow(length(x)))



plot(content$mpg,content$weight)
boxplot(content$mpg)
barplot(content$mpg)
hist(content$mpg)
hist(content$mpg, breaks = 10)
hist(content$mpg, breaks = 20)
hist(content$mpg, breaks = 30)


library(moments)
print(skewness(content$mpg))
print(kurtosis(content$mpg))