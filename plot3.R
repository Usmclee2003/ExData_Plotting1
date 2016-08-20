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

###plot 3
plot(data$Sub_metering_1~data$Datetime, ylab =  "Global Active Power (kilowatts)",  xlab = "", type = "l")
lines(data$Sub_metering_2~data$Datetime, col = "red")
lines(data$Sub_metering_3~data$Datetime, col = "Blue")
legend("topright",  lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"))



#### copy to a png file
dev.copy(png, file = "plot3.png",  width = 480, height = 480)
dev.off()