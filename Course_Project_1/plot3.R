#
#
#
# Data Science Specialization - Exploratory Data Analysis
# 
# Course Project 1
#
# July 2015
#
# In this project we use data from UCI to replicate some grahps
# Plot 3
#
#---------------------------------

# 1. Loading Subsetting and cleaning data
data <- read.table(file = "exdata-data-household_power_consumption/household_power_consumption.txt", 
                   header = TRUE, sep = ";",
                   colClasses = c("character", "character", "numeric",  "numeric",  "numeric",  "numeric",  "numeric", "numeric", "numeric"),
                   na.strings = "?",  )

# On a previous analysis I figured out that the specified dates were on the indexes ranging from: 66637 to 69516
data <- data[seq(66637,69516), ]

#Getting Date and Times merged in something we can use
data <- data.frame(data, DateTime = paste(data$Date, data$Time))
data$DateTime <- strptime(as.character(data$DateTime), format = "%d/%m/%Y %T")

#Reviewing data
str(data)
head(data)

# 3. Plot 3
png(filename = "plot3.png",
    width = 480, height = 480)
with(data, plot(Sub_metering_1, type = "n", xaxt = "n", xlab = "", ylab = "Energy sub metering"),
    plot(Sub_metering_2, type = "n"),
    plot(Sub_metering_3, type = "n"))
lines(data$Sub_metering_1)
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
axis(1, at = c(1,1441,2880), label = c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()