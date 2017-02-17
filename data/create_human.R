# Heinonen Petri
# 17.2.2017
# This script includes R code for data wrangling in assignment 4. of IODS-course

# Load the datasets

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

# Explore the data

str(hd)
summary(hd)

str(gii)
summary(gii)

# Rename variables with long column name

colnames(hd)[1] <- "hdi_rank"
colnames(hd)[2] <- "country" # Country is ok, I'll just make it lowercase
colnames(hd)[3] <- "hdi"
colnames(hd)[4] <- "life_exp"
colnames(hd)[5] <- "edu_years"
colnames(hd)[6] <- "gni_per_capita"
colnames(hd)[7] <- "gni_rank"

colnames(gii)[1] <- "gii_rank"
colnames(gii)[2] <- "country"
colnames(gii)[3] <- "gii"
colnames(gii)[4] <- "mat_mort_ratio"
colnames(gii)[5] <- "birth_rate"
colnames(gii)[6] <- "parlament"
colnames(gii)[7] <- "sec_edu_f"
colnames(gii)[8] <- "sec_edu_m"
colnames(gii)[9] <- "labour_f"
colnames(gii)[10] <- "labour_m"

# New variables

gii$sec_edu_ratio <- (gii$sec_edu_f / gii$sec_edu_m)

gii$labour_ratio <- (gii$labour_f / gii$labour_m)

# Join the datasets

# access the dplyr library
library(dplyr)

# country as identifier
join_by <- c("country")

# join the two datasets by the selected identifiers
hd_gii <- inner_join(hd, gii, by = join_by, suffix = c(".hd", ".gii"))

# see the new column names
colnames(hd_gii)

# glimpse at the data
glimpse(hd_gii)

# Combined dataset has 195 observations and 19 variable = correct!
