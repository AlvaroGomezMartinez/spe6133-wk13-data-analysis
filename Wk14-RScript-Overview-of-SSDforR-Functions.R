# Analyzing Baseline Data
require(SSDforR) #loads the SSDforR package
?ABrf2 # Obtain help with this function
?ABplot # Obtain help with this function
Getcsv() # Open the dialogue window to fetch the .csv file with data. For this exercise load the jenny.csv
attach(ssd) # Attaches the dataframe called ssd so we can work with the data
names(ssd) # Lists the variables included in the ssd dataframe

ABplot(yell,pyell,"Day","Number of yells per day","Jenny's Yelling") # Creates an x-y line graph for 'yell".
ABplot(cry,pcry,"Day","Number of crying episodes per day","Jenny's Crying") # Creates an x-y line graph for 'cry'".
ABplot(callout,pcallout,"Day","Number of calling out per day","Jenny's Calling Out") # Creates an x-y line graph for 'Callout".

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
SSDAnalysis <- "https://ssdanalysis.com/videos"
browseURL(SSDAnalysis) # References SSD for R website

Posit <- "https://posit.co/download/rstudio-desktop/"
browseURL(Posit) # Site to download R Studio

TheRProject <- "https://www.r-project.org/"
browseURL(TheRProject) # Site to download R

StandardCelerationChart <- "https://www.celeration.org/introduction/"
browseURL(StandardCelerationChart) # Site with information on Standard Celeration Charts

OgdenLindsley <- "http://precisionteaching.pbworks.com/w/page/18241059/Ogden%20Lindsley%20(1922-2004)"
browseURL(OgdenLindsley) # Site with information on Ogden Lindsley