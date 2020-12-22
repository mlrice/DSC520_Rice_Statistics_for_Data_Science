# Assignment: Exercise 5 American Community Survey
# Name: Rice, Michelle
# Date: 2020-12-20


## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
getwd()
setwd("/Users/mrice/DSC520_Rice/dsc520")

## Load the `data/acs-14-1yr-s0201.csv` to
acs_df <- read.csv("data/acs-14-1yr-s0201.csv")

# Please provide the output from the following functions: str(); nrow(); ncol()
str(acs_df)
nrow(acs_df)
ncol(acs_df)

sd(acs_df$HSDegree)
mean(acs_df$HSDegree)
median(acs_df$HSDegree)

# Create a Histogram of the HSDegree variable using the ggplot2 package.
ggplot(acs_df, aes(HSDegree)) + geom_histogram(bins=10, aes(y=..density..)) + xlab("Residents with HS Degree") + ylab("Number of counties") + ggtitle("Percentage of residents with a High School Degree by county")

# Include a normal curve to the Histogram
ggplot(acs_df, aes(HSDegree)) + geom_histogram(bins=10, aes(y=..density..)) + xlab("Residents with HS Degree") + ylab("Number of counties") + ggtitle("Percentage of residents with a High School Degree by county") + geom_function(fun = dnorm, args = list(mean = mean(acs_df$HSDegree),sd = sd(acs_df$HSDegree)))


# Create a probability of HS Degree
qplot(sample = HSDegree, data = acs_df) + stat_qq_line() + labs(x = "Theoretical Quantiles", y = "Sample Quantiles", title = "Probability of HS Degree")

# Quantify normality with numbers using the stat_desc() funcion
install.packages("pastecs")
library(pastecs)
stat.desc(acs_df[7], basic=TRUE, desc=TRUE, norm=TRUE, p=0.95)


