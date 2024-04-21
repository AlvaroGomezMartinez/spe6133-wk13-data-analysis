# Generate random numbers from a normal distribution
num_points <- 1000
random_numbers <- rnorm(num_points, mean = 0, sd = 1)

# Create a scatterplot of the random numbers
plot(density(random_numbers), main = "Bell Curve Scatterplot", xlab = "Value", ylab = "Density", col = "blue")

# Calculate mean and standard deviation
mean_val <- mean(random_numbers)
sd_val <- sd(random_numbers)

# Calculate mean and standard deviation
mean_val <- mean(random_numbers)
sd_val <- sd(random_numbers)

# Add mean and standard deviation lines
abline(v = mean_val, col = "red", lwd = 2, lty = 2, label = "Mean")
abline(v = c(mean_val - sd_val, mean_val + sd_val), col = "green", lwd = 2, lty = 2, label = "SD")