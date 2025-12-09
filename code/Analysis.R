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
print(names(cases_small))
print(names(deaths_small))


# Merge by date
merged <- merge(cases_small, deaths_small, by = "date", all = FALSE)


# remove rows which has null values 
merged <- merged[!is.na(merged$cases_new) & !is.na(merged$deaths_new), ]

summary(merged)
