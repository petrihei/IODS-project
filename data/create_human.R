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



# Data wrangling continues______________________

# GNI as numeric

as.numeric(hd_gii$gni_per_capita)

# Exclude unnecessary variables

# columns to keep
keep <- c("country", "sec_edu_ratio", "labour_ratio", "life_exp", "edu_years", "gni_per_capita", "mat_mort_ratio", "birth_rate", "parlament")

# select the 'keep' columns
hd_gii <- select(hd_gii, one_of(keep))

# print out a completeness indicator of the 'human' data
complete.cases(hd_gii)

# print out the data along with a completeness indicator as the last column
data.frame(hd_gii[-1], comp = complete.cases(hd_gii))

# filter out all rows with NA values
hd_gii_ <- filter(hd_gii, complete.cases(hd_gii))

# remove the Country variable


# define the last indice we want to keep
last <- nrow(hd_gii_) - 7

# choose everything until the last 7 observations
hd_gii_ <- hd_gii_[1:last,]

# add countries as rownames

rownames(hd_gii_) <- hd_gii_$country

hd_gii_ <- select(hd_gii_, -country)

# Write the file

write.csv(hd_gii_, "human.csv", row.names = TRUE)


