# Load and  Read the two files 

cases_file  <- "C:/Users/samina/Downloads/1data/cases_malaysia_clean.csv"
deaths_file <- "C:/Users/samina/Downloads/1data/deaths_malaysia.csv"


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

#Scatter plot cases_new vs deaths_new 
plot(merged$cases_new, merged$deaths_new,
     main = "Daily New Cases vs Daily New Deaths",
     xlab = "Daily New Cases",
     ylab = "Daily New Deaths",
     pch = 19,
     col = rgb(0,0,1,0.5))

# Bar plot of monthly COVID-19 cases
merged$month <- format(merged$date, "%Y-%m")

monthly_cases <- tapply(merged$cases_new, merged$month, sum)

barplot(monthly_cases,
        las = 2,
        col = "skyblue",
        main = "Monthly COVID-19 Cases",
        ylab = "Total Cases")

# Bar plot of monthly COVID-19 deaths
monthly_deaths <- tapply(merged$deaths_new, merged$month, sum)

barplot(monthly_deaths,
        las = 2,
        col = "tomato",
        main = "Monthly COVID-19 Deaths",
        ylab = "Total Deaths")

