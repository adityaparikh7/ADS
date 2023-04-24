data(mtcars)

mtcars <- mtcars[,2:ncol(mtcars)]

#scaling data
scaled_mtcars <- scale(mtcars)

#kmeans with 3 clusters
set.seed(123)
kmeans_output <- kmeans(scaled_mtcars, centers = 3)

# View the cluster assignments for each data point
kmeans_output$cluster

# View the cluster centers
kmeans_output$centers

#plotting the clusters
mtcars$cluster <- kmeans_output$cluster

# Create a vector of colors to represent the clusters
colors <- c("red", "blue", "green")

# Plot the clusters using the mpg and wt variables
plot(mtcars$hp, mtcars$wt, col = colors[mtcars$cluster],
     pch = 19, main = "K-Means Clustering of mtcars dataset",
     xlab = "Horsepower", ylab = "Weight")

# Add a legend to the plot
legend("topright", legend = levels(factor(mtcars$cluster)), 
       col = colors, pch = 19, bty = "n")

#printing the centroid
set.seed(123)
kmeans_model <- kmeans(mtcars[, c("hp", "wt")], centers = 3)

# Print the cluster centroids
kmeans_model$centers

#plotting centroid
plot(kmeans_model$centers, col = "black",
     pch = 19, main = "K-Means Clustering of mtcars dataset",
     xlab = "Horsepower", ylab = "Weight")




#implement apriori algorithm in r

# Load required libraries
library(arules)

# Load the Groceries dataset
data("Groceries")

# Apply Apriori algorithm to generate frequent itemsets
frequent_itemsets <- apriori(Groceries, parameter = list(support = 0.002, minlen = 2))

# Generate association rules from the frequent itemsets
association_rules <- as.data.frame(inspect(sort(frequent_itemsets, by = "lift")))

# Print the frequent itemsets and association rules
print("Frequent Itemsets:")
inspect(frequent_itemsets)
print("\nAssociation Rules:")
print(association_rules)
