# Heinonen Petri
# 3.2.2017
# This script includes R code for regression analysis in assignment 2. in IODS-course

# Access the dplyr and ggplot2 libraries
library(dplyr)
library(ggplot2)
library(GGally)


# Read data from URL

my_data <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/learning2014.txt", sep=",", header=TRUE)

dim(my_data)

str(my_data)


# access the GGally and ggplot2 libraries
library(GGally)
library(ggplot2)

# create advanced plot matrix with ggpairs()
p <- ggpairs(learning2014, mapping = aes(col=gender), lower = list(combo = wrap("facethist", bins = 20)))

# draw the plot
p

# create a regression model with multiple explanatory variables
my_model <- lm(points ~ attitude + stra + age, data = my_data)

# print out a summary of the model
summary(my_model)

# fit a linear model
my_model2 <- lm(points ~ attitude, data = my_data)

# print out a summary of the model
summary(my_model2)

# draw diagnostic plots using the plot() function. Choose the plots 1, 2 and 5 (Residuals vs Fitted values, Normal QQ-plot and Residuals vs Leverage)
par(mfrow = c(2,2))
plot(my_model2, which = c(1, 2, 5))