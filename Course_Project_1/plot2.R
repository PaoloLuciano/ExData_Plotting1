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
# Plot 2
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

# 3. Plot 2
png(filename = "plot2.png",
    width = 480, height = 480)
plot(data$Global_active_power, type = "n",xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Global_active_power)
axis(1, at = c(1,1441,2880), label = c("Thu", "Fri", "Sat"))
dev.off()
