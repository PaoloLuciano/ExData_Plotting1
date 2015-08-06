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
# Plot 1
#
#---------------------------------

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

# 2. Subetting the relevant dates
data.relevant <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# 3. Plot 1
png(filename = "Course_Project_1/plot1.png", width = 480, height = 480)
hist(data.relevant$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()

