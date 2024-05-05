# Analyzing Baseline Data with Statistics

require(SSDforR) #loads the SSDforR package
library(formatR) #loads the formatR package for formatting R code

?ABrf2 # Obtain help with this function
# Lag-1 autocorrelation - Testing for autocorrelation at lag-1 is important in time series analysis because it helps to identify whether there is a pattern in the data where each data point is related to the immediately preceding data point. Autocorrelation can impact the reliability of statistical analyses, such as regression models, and can affect the validity of time series forecasts.
# If autocorrelation at lag-1 is present, it indicates that there may be a pattern or dependency in the data that needs to be accounted for in the analysis. Detecting and addressing autocorrelation is essential to ensure the accuracy and reliability of statistical inferences drawn from time series data.

?ABplot # Simple line graph. Obtain help with this function

Getcsv() # Open the dialogue window to fetch the .csv file with data. For this exercise load the jenny.csv

attach(ssd) # Attaches the dataframe called ssd so we can work with the data by directly referencing the variable by their names within the R code.

names(ssd) # Lists the variables included in the ssd dataframe

summary(ssd) # Provides descriptive statistics (min, max, quartiles, mean for numerical values and frequencies for factors) for the entire database

ABplot(yell, pyell, "Day", "Number of yells per day", "Jenny's Yelling") # Creates an x-y line graph for 'yell"
# First determine if the behavior is typical. Do this by determining how the events vary around the mean or median.
ABstat(yell, pyell, "A", "mean") # Follow the instructions in the Console
ABtext("Mean = 2.8") # Label the mean line
ABstat(yell, pyell, "A", "median") # Follow the instructions in the Console
ABtext("Median = 2") # Label the median line
# We can now see that the points in the graph vary widely from the mean and median. The sixth point is the furthest below the mean and median while points ten, twelve, and thirteen are the furthest above.

# Another way to enhance your visual analysis is to examine how the data fall around standard deviation (SD) bands. Approximately 2/3 of all data falls above and below 1 SD. Data falling outside of the SD can be either desirable or undesirable (depending on your intervention's intent).
sd1bandgraph(yell, pyell, "A", "Time", "Amount of yelling", "Jenny's Yelling (1-SD)")
ABtext("+1 SD")
ABtext("-1 SD")
ABtext("Mean")
# Using two standard deviations would be considered even more rigorous because approximately 95% of all scores in a normal distribution are within plus or minus two standard deviations of the mean.
sd2bandgraph(yell, pyell, "A", "Time", "Amount of yelling", "Jenny's Yelling (2-SD)")
# If we evaluated using 2SDs none of the values would be considered unusual.

# To look at Jenny’s behavior more closely, we could create another helpful graph in evaluating the baseline.
ABdescrip(yell, pyell) # Creates a boxplot.
# As we continue our visual analysis of the baseline, it is important to assess if the data has a trend and to note the direction of the trend (i.e., increasing or decreasing). The trend can also be completely flat or irregular. The goal of an intervention may be to reverse the trend in a negative behavior or increase it for positive behavior. It is important to detect a trend early on because a strong trend will impact the type of data analysis that is appropriate to assess if there is statistically significant change in the behavior between phases.
Aregres(yell, pyell, "A")
# The graph displays a slight trend in the data with the blue regression line displaying the slope; however, note that the individual data points (6, 10, 12, & 13) are not clustered tightly around the regression line. These values show that the degree of change can be quantified by the estimate for x1 of 0.13214, which is the slope of the regression line. This can be interpreted as follows: for every one unit increase in time, there is a 0.13214 increase in the yelling behavior. The column labeled “t value” is a test for the statistical significance of the slope and constant. The last column labeled “Pr(>|t|)” is the probability of making a Type I error (i.e., concluding that the coefficient for the slope is greater than 0). Because the probability is greater than the commonly accepted 0.05 threshold (p = 0.0791), the slope is not considered statistically significant! Despite an insignificant p-value, however, we may still want to consider the fit of the data around the regression line because, again, significance may be hard to achieve, particularly with small sample sizes.
# A visual inspection of the graph suggests that the data are not linear and outliers at points ten, twelve, and thirteen impact the slope by pulling it upward.

# Let's look at another of Jenny's behaviors.
ABplot(cry, pcry, "Day", "Number of crying episodes per day", "Jenny's Crying") # Creates an x-y line graph for 'cry'".
ABdescrip(cry, pcry)
# Let's look for outliers. A great way to do this is to use the two-SD band graph
sd2bandgraph(cry, pcry, "A", "Time", "Amount of yelling", "Jenny's Crying (2-SD)") # Here we can see that the fourteenth point is above two standard deviations and would be considered an outlier
# Let's look at the regression line
Aregres(cry, pcry, "A")
# A visual inspection of the data from the graph indicates that the crying behavior has a stronger linear relationship with time compared to Jenny’s yelling behavior as the data points are clustered more tightly around the regression line. As the estimate of 0.4121 for x1 indicates, the number of crying episodes increases by 0.4121 for each unit increase in time and the slope is statistically significant. Part of the objective of an intervention, then, may be to reverse the increasing trend for both yelling and crying displayed in the baseline.

ABplot(callout, pcallout, "Day", "Number of calling out per day", "Jenny's Calling Out") # Creates an x-y line graph for 'Callout".

# Using percentage of Non-Overlapping Data (PND) to determine effect size
# We're going to need a dataset that has baseline and intervention data.
detach(ssd) # Detach the current dataframe
Getcsv() # Get the AB data frame named JennyAB.csv
attach(ssd) # Attach the ssd dataframe

names(ssd) # Look at the names of the variables. Let's use esteem for this example.
ABplot(esteem, pesteem, "Session", "Behavior", "Jenny's Esteem")
# Since the intervention data is above the baseline data, let's use PND above
PNDabove(esteem, pesteem, "A", "B") # We see the plot and we also get the percentage in the Console. PND above = 0.75 as PND above which is moderate effectiveness

# Next, let's look at the callout behavior.
# Plot PND Below
PNDbelow(callout, pcallout, "A", "B") # PND below is 0.08 which statistically is not effective.
# Plot PND Above
PNDabove(callout, pcallout, "A", "B") # PND above is 0, again statistically not effective. Taking both of these statistics into account, we can make a determination that the intervention is not effective, however, to be more certain let's visually analyze the data to get another perspective.
ABplot(callout, pcallout, "Session", "Behavior", "Jenny's Callout")
# It appears that the intervention behavior is attempting to decrease the behavior. This plot shows us that even though the statistics for both PND below and PND above determined that the intervention was not effective, we can see that it is definitely decreasing the behavior and even though we didn't have a jump down, we still have an effect. Let's see if the slope in the behavior is statistically significant. Let's test the regression line.
Aregres(callout, pcallout, "B")
# If we look at the plot, we can see that the data points are close to the regression line. Other than the fifth point, the rest of them are very close to the line. If we look at the statistics in the Console we see that the Pr(>|t|) has *** meaning that the results are less than 0.05 which gives us great confidence. Also, the adjusted R-squared value of 0.9327 indicates that 93.27% of the variability in the response variable is explained by the predictor variable x1. This gives us great confidence that the treatment is effective and the slope is statistically significant.

# SUMMARY OF FUNCTIONS AVAILABLE ON THE SSDforR PACKAGE
# SSD for R supports the full-range of analysis that can be conducted with single-subject research data. A brief overview of these functions are described here.
# Basic Graphing Functions — these include a set of commands that will allow you to make and label a variety of graphs, draw vertical lines between phases, and note critical incidences. Graphs include, among other things, simple line graphs (with or without mean or median lines), standard deviation graphs, and graphs showing interquartile ranges. These graphs can be exported in a number of different formats.
# Functions Associated with Descriptive and Basic Statistics — these include basic descriptive statistics including mean, median, standard deviations, and quartiles. Also available are effect sizes and basic regression.
# Functions Associated with Statistical Process Control (SPC) Charts — these include X-R-charts, R-charts, p-charts, X-mr-charts, and c-charts. Again, all charts and graphs can be exported in a variety of formats.
# Functions Associated with Autocorrelation and Data Transformations — these are appropriate for calculating and dealing with issues of autocorrelation, which are unique to time-series research designs.
# Functions Associated with Hypothesis Testing — these enable users to test whether there are statistically significant differences between two or more phases. Available tests include t-tests, chi-square, ANOVA, binomial, and conservative dual criteria.
# Functions Appropriate for Analyzing Group Data — these are suitable for analyzing group data, including variation of individuals’ behaviors within a group.
# Functions Suitable for Community or System-wide Data — these functions are used to examine large amounts of data across phases and are typically used in time-series research that may go beyond the scope of one client or client group.

# Reference these windows for the lecture recording:
ssdAnalysis <- "https://ssdanalysis.com/videos"
browseURL(ssdAnalysis) # References SSD for R website

posit <- "https://posit.co/download/rstudio-desktop/"
browseURL(posit) # Site to download R Studio

theRProject <- "https://www.r-project.org/"
browseURL(theRProject) # Site to download R

standardCelerationChart <- "https://www.celeration.org/introduction/"
browseURL(standardCelerationChart) # Site with information on Standard Celeration Charts

ogdenLindsley <- "http://precisionteaching.pbworks.com/w/page/18241059/Ogden%20Lindsley%20(1922-2004)"
browseURL(ogdenLindsley) # Site with information on Ogden Lindsley

tidy_source()
