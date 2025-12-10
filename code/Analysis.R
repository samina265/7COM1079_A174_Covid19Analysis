# Load and  Read the two files 

cases_file  <- "C:/Users/sajjad/Downloads/1data/cases_malaysia_clean.csv"
deaths_file <- "C:/Users/sajjad/Downloads/1data/deaths_malaysia.csv"


cases  <- read.csv(cases_file)
deaths <- read.csv(deaths_file)

# Convert date columns
cases$date  <- as.Date(cases$date)
deaths$date <- as.Date(deaths$date)

# keep this column date, cases_new ,deaths_new from 2 files 

cases_clean  <- cases[, c("date", "cases_new")]
deaths_clean <- deaths[, c("date", "deaths_new")]

# Check columns
print(names(cases_clean))
print(names(deaths_clean))

# Merge by date
merged <- merge(cases_clean, deaths_clean, by = "date", all = FALSE)

# remove rows which has null values 
merged <- merged[!is.na(merged$cases_new) & !is.na(merged$deaths_new), ]

#summary(merged)

# Histogram: daily new cases
hist(merged$cases_new,
     main = "Histogram of Daily New Cases",
     xlab = "Daily New Cases",
     col = "skyblue")

# Histogram: daily new deaths
hist(merged$deaths_new,
     main = "Histogram of Daily New Deaths",
     xlab = "Daily New Deaths",
     col = "tomato")
