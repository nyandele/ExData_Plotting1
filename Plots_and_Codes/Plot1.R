ls()
rm(list = ls())

getwd()
setwd("/Users/janenyandele/Desktop/Coursera Assignments/Exploratory Data Analysis/Week 01/Programming Assignment")


################### Download, Unzip and Load the dataset

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "power_data.zip")
unzip("power_data.zip")

#calculate memory needed
file_path <- "/Users/janenyandele/Desktop/Coursera Assignments/Exploratory Data Analysis/Week 01/Programming Assignment/household_power_consumption.txt"
file_info <- file.info(file_path)
file_size <- file.info(file_path)$size
print(paste("The file size is", file_size, "bytes."))

power_data <- read.csv(file_path, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE,
                       check.names = FALSE)

#Subset the needed dataframe and convert the date column
str(power_data)
power_subset <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))
power_subset$Date <- as.Date(power_subset$Date, format = "%d/%m/%Y")
str(power_subset)

### Construct Plot 1
hist(power_subset$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power", col = "red", breaks = 15)
png("plot1.png", width = 480, height = 480)
dev.off()
#or
dev.copy(png, "plot1.png")
dev.off()












































































































































