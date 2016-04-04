
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



#open graphics file device
png(file = paste(mainPath, "plot1.png", sep = ""))

#create the histogram
with(febData, hist(as.numeric(febData[,"Global_active_power"]), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")) 

#close the graphics file device
dev.off()


