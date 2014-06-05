## This script loads the Individual household electric power consumption Data Set
## from the UC Irvine Machine Learning Repository, constructs a desired graph, and
## saves that graph as a png file

## reads in data (assumes that it's located in working directory)
hpcfull <- read.table(paste0(getwd(),"/household_power_consumption.txt"), sep=";", header = TRUE, na.strings="?",
                      colClasses = c("character","character",rep("numeric",7)))

## formats dates and times
hpcfull$Date <- as.Date(hpcfull$Date, format="%d/%m/%Y")
hpcfull$Time <- strptime(paste(hpcfull$Date, hpcfull$Time), format="%Y-%m-%d %H:%M:%S")

## takes subset of desired dates
hpc <- subset(hpcfull, hpcfull$Date >= "2007-02-01" & hpcfull$Date <= "2007-02-02")

## opens png graphics device to which the time-series will be outputted
png("plot2.png")

## constructs a time series
plot(hpc$Time,hpc$Global_active_power, xlab = "", type = "l", ylab="Global Active Power (kilowatts)")

## closes graphics device
dev.off()