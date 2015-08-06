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

# 0. Preamble to get the labels on englis
Sys.setlocale("LC_ALL", "English") #This is for a Windows machine

# 1. Loading and Cleaning data
data <- read.table(file = "Data/exdata-data-household_power_consumption/household_power_consumption.txt", 
                   header = TRUE, sep = ";",
                   colClasses = c("character", "character", "numeric",  "numeric",  "numeric",  "numeric",  "numeric", "numeric", "numeric"),
                   na.strings = "?",  )

#Getting Date and Times merged in something we can use to plot correctly
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Reviewing data
str(data)
head(data)
sapply(data, FUN = class)

# 2. Subetting the relevant dates
data.relevant <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# 3. Plot 3
png(filename = "Course_Project_1/plot3.png", width = 480, height = 480)

plot(data.relevant$DateTime, data.relevant$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data.relevant$DateTime, data.relevant$Sub_metering_2, col = "red")
lines(data.relevant$DateTime, data.relevant$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
