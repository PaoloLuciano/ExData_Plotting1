library(dplyr)

#Read in data set
power <- read.table("./household_power_consumption.txt", sep = ";",
                    na.strings = "?", header = TRUE)

#Create new POSIXct variable from both Date and Time
power$newdate <- with(power, as.POSIXct(paste(Date, Time), 
                                        format="%d/%m/%Y %H:%M:%S"))

#Reformat Date variable as Date
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

#Use only observations from February 1st and 2nd per instructions
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")

#Write to PNG file
png(file = "plot2.png", width = 480, height = 480)
with(power, plot(newdate, Global_active_power, type = "l", xlab = "", 
                 ylab = "Global Active Power (kilowatts)"))
dev.off() #Close PNG file





setwd("~/Dropbox/Courses/Coursera - Exploratory data analysis/ExData_Plotting1/")
Sys.setlocale("LC_MESSAGES", 'en_GB.UTF-8')

df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

t <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(t$DateTime,
     t$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()