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

######plot4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))   #####call to let graphics device know it will be multiple plots
plot(data$Global_active_power ~ data$Datetime, type = "l", ylab = "Global Active Power", xlab = "")  ### plot top left
plot(data$Voltage ~ data$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")  ###plot top right
plot(data$Sub_metering_1 ~ data$Datetime, type = "l", ylab = "Energy sub metering", xlab = "")  ####plot bottom right
lines(data$Sub_metering_2 ~ data$Datetime, col = 'Red')  ### adding lines to the plot
lines(data$Sub_metering_3 ~ data$Datetime, col = 'Blue')  ### adding another line to the plot
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Global_reactive_power ~ data$Datetime, type = "l", ylab = "Global_rective_power", xlab = "datetime")  ###plot bottom right

#### copy to a png file
dev.copy(png, file = "plot4.png",  width = 480, height = 480)
dev.off()