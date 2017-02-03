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