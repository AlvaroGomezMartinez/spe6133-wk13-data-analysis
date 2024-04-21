# Generate random numbers from a normal distribution
num_points <- 1000
random_numbers <- rnorm(num_points, mean = 100, sd = 15)

# Create a scatterplot of the random numbers
plot(density(random_numbers), main = "Bell Curve Scatterplot", xlab = "Value", ylab = "Density", col = "blue")

# Calculate mean and standard deviation
mean_val <- mean(random_numbers)
sd_val <- sd(random_numbers)

# Add mean line
abline(v = mean_val, col = "red", lwd = 2, lty = 2, label = "Mean")

# Add +1 & -1 standard deviation lines
abline(v = c(mean_val - sd_val, mean_val + sd_val), col = "green", lwd = 2, lty = 2, label = "SD")

# Add +2 & -2 standard deviation lines
abline(v = c(mean_val - 2 * sd_val, mean_val + 2 * sd_val), col = "purple", lwd = 2, lty = 2, label = "2SD")
