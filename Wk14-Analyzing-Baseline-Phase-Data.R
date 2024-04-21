#Retrieve and attach the baseline file called stability.csv
Getcsv()
attach(ssd)
head(ssd)

# In general, analyzing baseline data is simply a matter of describing it. Traditionally single-subject research uses visual analysis to accomplish this, and descriptive statistics, such as the mean, standard deviation, median, and quantiles, are used to provide more in-depth information. SSD for R can be used to accomplish this and will be described with example datasets.

ABplot(flat,pflat,"Time","Behavior","Flat Stable Line") # Example of a flat stable line. This is a desirable pattern because once intervention is applied changes to the behavior would be readily apparent.

ABplot(increasing,pincreasing,"Time","Behavior","Increasing Stable Line") # This is also an example of a stable line in that the future increasing trend can be predicted.

ABplot(semi,psemi,"Time","Behavior","Semi-Stable Line") # Although a future trend can be predicted, the wide differences between data points make it difficult to draw any conclusions with certainty. Visually comparing this semi-stable baseline to future intervention data is difficult.

ABplot(unstable,punstable,"Time","Behavior","Unstable Line") # This is an extremely variable baseline with no ability to predict the future. Ideally, the best way to deal with this type of baseline is to continue to collect data until a pattern stabilizes.

detach(ssd) # Detach the current dataframe
Getcsv() # Get the jenny.csv file
attach(ssd)

#Draw a line graph to display Jenny's yelling behavior
ABplot(yell, pyell, "day", "frequency", "Jenny's Yelling") # To begin our visual analysis, we need to determine if the behavior is typical. We do this by determining how the events vary around the mean or median.
ABstat(yell,pyell,"A","mean") # This layers a mean line on the x-y graph we created
ABtext("mean=2.8") # This adds text to the mean line
ABstat(yell,pyell,"A","median") # This layers the median on the x-y graph
ABtext("median=2") # This adds text to the median line
# We can now see that the points in the graph vary widely from the mean and median.

# Another way to enhance our visual analysis is to examine how the data fall around standard deviation bands, which display the mean along with lines depicting the bounds of either one or two standard deviation around the mean. 
# Approximately two-thirds of all data in a normal distribution fall between one standard deviation (sd) above and one standard deviation below the mean. Bloom et al. (2009) suggest that, depending on the nature of the behavior, data falling outside of one standard deviation can be defined as desirable or undesirable, depending on the behavior being measured.
sd1bandgraph(yell, pyell, "A", "day", "frequency", "Jenny's Yelling (1-SD)")
ABtext("KEY: mean=4.06, +1 SD=4.06, -1 SD=1.54")
# We can expand the bands to two standard deviations
sd2bandgraph(yell, pyell, "A", "day", "frequency", "Jenny's Yelling (2-SD")
ABtext("KEY: mean=2.8, +2 SD=1.26, -2 SD=0.27")

# Let's look at crying now
ABdescrip(cry, pcry)
sd2bandgraph(cry,pcry,"A","Time","Amount of Crying","Jenny's Crying (2-SD")

#Check for a trends
Aregres(cry, pcry, "A")
Aregres(yell, pyell, "A") # These values show that the degree of change can be quantified by the estimate for x1 of 0.13214, which is the slope of the regression line. This can be interpreted as follows: for every one unit increase in time, there is a 0.13214 increase in the yelling behavior. The column labeled “t value” is a test for the statistical significance of the slope and constant. The last column labeled “Pr(>|t|)” is the probability of making a Type I error (i.e., concluding that the coefficient for the slope is greater than 0). Because the probability is greater than the commonly accepted 0.05 threshold (p = 0.0791), the slope is not considered statistically significant. Despite an insignificant p-value, however, we may still want to consider the fit of the data around the regression line because, again, significance may be hard to achieve, particularly with small sample sizes.

#Check for autocorrelation in baseline data
ABrf2(yell, pyell, "A")

#Rerun retrieval code to get Anthony's data
#Draw a line graph to display Jenny's yelling behavior
ABdescrip(checking, pchecking)
ABplot(checking, pchecking, "day", "frequency", "Anthony Checking")
ABstat(checking,pchecking,"A","mean")
ABtext("mean=4")
sd1bandgraph(checking, pchecking, "A", "day", "frequency", "Anthony Checking (1-SD)")
ABtext("KEY: mean=4, +1 SD=4.89, -1 SD=3.11")
sd2bandgraph(checking, pchecking, "A", "day", "frequency", "Anthony Checking (2-SD)")
ABtext("KEY: mean=4, +2 SD=5.79, -1 SD=2.21")
#Check for a trend in the baseline data
Aregres(checking, pchecking, "A")

#Check for autocorrelation in baseline data
ABrf2(checking, pchecking, "A")