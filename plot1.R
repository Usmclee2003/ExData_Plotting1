## Getting full dataset
dataset<- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                   na.strings = "?", ##### Na's are listed as ? in this data set so can convert ? to na values
                   stringsAsFactors = F)
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")  ###from character to date class

## Subsetting the data
data <- subset(dataset, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)  ### merging the date and time together
data$Datetime <- as.POSIXct(datetime)             ### converting to datetime

###Plot 1 
hist(data$Global_active_power, col = "red", xlab =  "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Acive Power")
dev.copy(png, file = "plot1.png",  width = 480, height = 480)
dev.off()