
#declare folder paths

mainPath <- "T:/School/Coursera/Data Science Specialization/Course 4 - Exploratory Data Analysis/Week 1/Course Project 1/"
fileName <- "exdata_data_household_power_consumption/household_power_consumption.txt"
importFile <- paste(mainPath, fileName, sep = "")

#import the data

#columns are separated by semicolons
#missing values are "?"
rawData <- read.table(importFile, header = TRUE, sep = ";", na.strings = "?")

#filter the data

#note that the date of the first column is coded as d/m/yyyy
febData <- rawData[which(rawData[,1] %in% c("1/2/2007", "2/2/2007")),]

#overwrite to numeric date format %m/%d/%Y
febData[,"Date"] <- as.Date(as.character(febData[,"Date"]), "%d/%m/%Y")

#open graphics file device
png(file = paste(mainPath, "plot4.png", sep = ""))

#declare a 2x2 panel 
par(mfrow=c(2,2))

#create the top left graph:
with(febData, plot(strptime(paste(febData[,"Date"], febData[,"Time"]), "%Y-%m-%d %H:%M:%S"), febData[,"Global_active_power"], type = "l", xlab = "", ylab = "Global Active Power"))

#create the top right graph:
with(febData, plot(strptime(paste(febData[,"Date"], febData[,"Time"]), "%Y-%m-%d %H:%M:%S"), febData[,"Voltage"], type = "l", xlab= "datetime", ylab = "Voltage")) 

#create the bottom left graph:
with(febData, plot(strptime(paste(febData[,"Date"], febData[,"Time"]),"%Y-%m-%d %H:%M:%S"), febData[,"Sub_metering_1"], type = "l", xlab = "", ylab = "Energy sub metering")) 
with(febData, lines(strptime(paste(febData[,"Date"], febData[,"Time"]),"%Y-%m-%d %H:%M:%S"), febData[,"Sub_metering_2"], col = "red")) 
with(febData, lines(strptime(paste(febData[,"Date"], febData[,"Time"]),"%Y-%m-%d %H:%M:%S"), febData[,"Sub_metering_3"], col = "blue")) 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1) 

#create the bottom right graph:
with(febData, plot(strptime(paste(febData[,"Date"], febData[,"Time"]), "%Y-%m-%d %H:%M:%S"), febData[,"Global_reactive_power"], type = "l", xlab= "datetime", ylab = "Global_reactive_power")) 

#close the graphics file device
dev.off()
