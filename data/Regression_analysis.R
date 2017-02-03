# Heinonen Petri
# 3.2.2017
# This script includes R code for regression analysis in assignment 2. in IODS-course

# Access the dplyr and ggplot2 libraries
library(dplyr)
library(ggplot2)

# Read data from URL

my_data <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/learning2014.txt", sep=",", header=TRUE)

dim(my_data)

str(my_data)

# initialize plot with data and aesthetic mapping
p1 <- ggplot(my_data, aes(x = age, y = points, col = gender))

# define the visualization type (points)
p2 <- p1 + geom_point()