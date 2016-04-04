
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
febData <- rawData[which(rawData[,"Date"] %in% c("1/2/2007", "2/2/2007")),]

#overwrite to numeric date format %m/%d/%Y
febData[,"Date"] <- as.Date(as.character(febData[,"Date"]), "%d/%m/%Y")

#open graphics file device
png(file = paste(mainPath, "plot2.png", sep = ""))

#create the line graph
with(febData, plot(strptime(paste(febData[,"Date"], febData[,"Time"]), "%Y-%m-%d %H:%M:%S"), febData[,"Global_active_power"], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#close the graphics file device
dev.off()

