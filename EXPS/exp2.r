# 1.Let us assume that a professional basketball team wants to compare its performance with that of players in a regional league. 
# The pros are known to have a historic mean of 12 points per game with a standard deviation of 5.5. 
# A group of 36 regional players recorded on average 10.7 points per game. 
# The pro coach would like to know whether his professional team scores on average are different from that of the regional players.

sd = 5.5
n = 36
x = 12
mean = 10.7
z = (x - mean)/(sd/sqrt(n))
print(z)
alpha = 0.05
p_val<-round(pnorm(z))
print(p_val)
if(p_val>alpha){
    print("p_value > alpha")
    print("Accept Null Hypothesis")
}else{
    print("p_value < alpha")
    print("Reject Null Hypothesis")
}
# [1] 1.418
# The p-value is 0.0062, which is less than 0.05.
# Therefore, we reject the null hypothesis and conclude that the mean of the professional team is different from that of the regional players.





# 2.	Consider the case where a large franchise wants to determine the performance of a newly opened store. 
# The franchise surveyed a sample of 35 existing stores and found that the average weekly sales were $166,000 with a standard deviation of $25,000. 
# The new store on average reported a weekly sale of $170,000. 
# The managers behind the launch of the new store are of the view that the new store represents the new approach to retailing, 
# which is the reason why the new store sales are higher than the existing store. 
# Despite their claim of effectively reinventing the science of retailing,
# the veteran managers maintain that the new store is reporting slightly higher sales because of the novelty factor, 
# which they believe will soon wear off.
# In addition, they think that statistically speaking, the new store sales are no different from the sample of existing 35 stores. 
# The question, therefore, is to determine whether the new store sale figures are different from the sales at the existing stores


sd = 25000
n = 35
x = 166000
mean = 170000
z = (mean - x)/(sd/sqrt(n))
print(z)
alpha=0.05
p_val<-round(pnorm(z))
print(p_val)
if(p_val>alpha){
    print("p_value > alpha")
    print("Accept Null Hypothesis")
}else{
    print("p_value < alpha")
    print("Reject Null Hypothesis")
}
# [1] 0.94
# The p-value is 0.429, which is greater than 0.05.
# Therefore, we fail to reject the null hypothesis and conclude that the mean of the new store is not different from that of the existing stores.




# 3.	For any inbuilt datasets available in R (Use library(help=”datasets”) to find the datasets of R) , 
# define null and alternative hypothesis on means 
# (Comparing the sample mean to a population mean when the population standard deviation is known or unknown)  
# and test the hypothesis using z-test and t-test. 

# One of the built-in datasets in R is the "mtcars" dataset, which contains data on various characteristics of 32 cars from the 1970s.
# Null Hypothesis: The mean miles per gallon (mpg) of all cars in the population is equal to a specified value.
# Alternative Hypothesis: The mean mpg of all cars in the population is different from the specified value.
# If the population standard deviation is known, we can use a z-test to test this hypothesis.

#z test

alpha <- 0.05
null_mean <- 20
x_bar <- mean(mtcars$mpg)
s <- sd(mtcars$mpg)
z <- (x_bar - null_mean) / (s / sqrt(length(mtcars$mpg)))
print(z)
p_value <- 2 * pnorm(-abs(z))
print(p_value)
if (p_value < alpha) {
  print("Reject the null hypothesis")
} else {
  print("Fail to reject the null hypothesis")
}

#t test

alpha <- 0.05
null_mean <- 20
x_bar <- mean(mtcars$mpg)
s <- sd(mtcars$mpg)
t <- (x_bar - null_mean) / (s / sqrt(length(mtcars$mpg)))
print(t)
df <- length(mtcars$mpg) - 1
p_value <- 2 * pt(-abs(t), df)
print(p_value)
if (p_value < alpha) {
  print("Reject the null hypothesis")
} else {
  print("Fail to reject the null hypothesis")
}
