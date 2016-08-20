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

###plot 2
plot(data$Global_active_power~data$Datetime, ylab =  "Global Active Power (kilowatts)",  xlab = "", type = "l")

#### copy to a png file
dev.copy(png, file = "plot2.png",  width = 480, height = 480)
dev.off()