#load data

data <- read.csv("C:/Users/samina/Downloads/cases_malaysia_clean.csv")

# print(data)

# null value checked
sum(is.na(data))

# any missing values in columns
colSums(is.na(data))

summary(data)
