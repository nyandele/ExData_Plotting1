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

#Make a row that pastes together Date and Time
power_subset$DateTime <- paste(power_subset$Date, power_subset$Time)
power_subset$datetime <- as.POSIXct(power_subset$DateTime)
str(power_subset)
#remove the DateTime column with dates as character strings
power_subset1 <- power_subset[, -c(10)]

### Construct Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(power_subset1, {
  plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (Kilowatts)")
  plot(Voltage ~ datetime, type = "l", ylab = "Voltage (Volt)")
  plot(Sub_metering_1 ~ datetime, type = "l",
       ylab = "Global Active Power (Kilowatts)")
    lines(Sub_metering_2 ~ datetime, col = "Red")
    lines(Sub_metering_3 ~ datetime, col = "Blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_meteing_1", "Sub_meteing_1", "Sub_meteing_3"))
  plot(Global_reactive_power ~ datetime, type = "l", ylab = "Global Reactive Power (Kilowatts)")
  
})
dev.copy(png, "plot4.png", height = 480, width = 480)
dev.off()



















