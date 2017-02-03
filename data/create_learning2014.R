# Heinonen Petri
# 2.2.2017
# This script includes R code for assignment 2. in IODS-course

# Access the dplyr library
library(dplyr)

# Read data from URL

my_data <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Explore the data 

dim(my_data)

str(my_data)

# Data 183 rows and 60 columns. Most of the data is integers

# print the "Attitude" column vector of the lrn14 data
my_data$Attitude

# divide each number in the column vector
my_data$Attitude / 10

# create column 'attitude' by scaling the column "Attitude"
my_data$attitude <- my_data$Attitude / 10 

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(my_data, one_of(deep_questions))
my_data$deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(my_data, one_of(surface_questions))
my_data$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(my_data, one_of(strategic_questions))
my_data$stra <- rowMeans(strategic_columns)

# choose columns to keep
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

# select the 'keep_columns' to create a new dataset
learning2014 <- select(my_data, one_of(keep_columns))

# select rows where points is greater than zero
learning2014 <- filter(learning2014, Points > 0)

# see the stucture of the new dataset
str(learning2014)

# write data to csv

write.csv(learning2014, file = 'learning2014.csv')



