# Analyzing Baseline Data
Getcsv()
attach(ssd)
names(ssd)

## Reference these windows for the lecture recording:
SSDAnalysis <- "https://ssdanalysis.com/videos"
browseURL(SSDAnalysis)

Posit <- "https://posit.co/download/rstudio-desktop/"
browseURL(Posit)

TheRProject <- "https://www.r-project.org/"
browseURL(TheRProject)

StandardCelerationChart <- "https://www.celeration.org/introduction/"
browseURL(StandardCelerationChart)

OgdenLindsley <- "http://precisionteaching.pbworks.com/w/page/18241059/Ogden%20Lindsley%20(1922-2004)"
browseURL(OgdenLindsley)

# SUMMARY OF FUNCTIONS
# SSD for R supports the full-range of analysis that can be conducted with single-subject research data. A brief overview of these functions are described here.
# Basic graphing functions — these include a set of commands that will allow you to make and label a variety of graphs, draw vertical lines between phases, and note critical incidences. Graphs include, among other things, simple line graphs (with or without mean or median lines), standard deviation graphs, and graphs showing interquartile ranges. These graphs can be exported in a number of different formats.
# Functions associated with descriptive and basic statistics — these include basic descriptive statistics including mean, median, standard deviations, and quartiles. Also available are effect sizes and basic regression.
# Functions associated with statistical process control (SPC) charts—these include X-R-charts, R-charts, p-charts, X-mr-charts, and c-charts. Again, all charts and graphs can be exported in a variety of formats.
# Functions associated with autocorrelation and data transformations—these are appropriate for calculating and dealing with issues of autocorrelation, which are unique to time-series research designs.
# Functions associated with hypothesis testing—these enable users to test whether there are statistically significant differences between two or more phases. Available tests include t-tests, chi-square, ANOVA, binomial, and conservative dual criteria.
# Functions appropriate for analyzing group data—these are suitable for analyzing group data, including variation of individuals’ behaviors within a group.
# Functions suitable for community or system-wide data—these functions are used to examine large amounts of data across phases and are typically used in time-series research that may go beyond the scope of one client or client group.

# FLAT STABLE LINE
