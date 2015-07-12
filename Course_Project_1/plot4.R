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
png(filename = "plot4.png",
    width = 480, height = 480)

par(mfrow = c(2,2))

    # Sub 1
    plot(data$Global_active_power, type = "n",xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(data$Global_active_power)
    axis(1, at = c(1,1441,2880), label = c("Thu", "Fri", "Sat"))

    # Sub 2
    plot(data$Voltage, type = "n",xaxt = "n", xlab = "datetime", ylab = "Voltage")
    lines(data$Voltage)
    axis(1,at = c(1,1441,2880), label = c("Thu", "Fri", "Sat"))

    # Sub 3
    with(data, plot(Sub_metering_1, type = "n", xaxt = "n", xlab = "", ylab = "Energy sub metering"),
         plot(Sub_metering_2, type = "n"),
         plot(Sub_metering_3, type = "n"))
    lines(data$Sub_metering_1)
    lines(data$Sub_metering_2, col = "red")
    lines(data$Sub_metering_3, col = "blue")
    axis(1, at = c(1,1441,2880), label = c("Thu", "Fri", "Sat"))
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    # Sub 4
    plot(data$Global_reactive_power, type = "n",xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
    lines(data$Global_reactive_power)
    axis(1, at = c(1,1441,2880), label = c("Thu", "Fri", "Sat"))

dev.off()