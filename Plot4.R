## Read the data and load into mydata

mydata <- read.table("household_power_consumption.txt", header = T, sep = ";")

## convert the Date variable from Factor to Date class
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

## slect those rows for specific dates 2007-02-01 and  2007-02-02
selectedData <- mydata[mydata$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]


#Plot 4

selectedData$Global_active_power <- as.numeric(selectedData$Global_active_power)
selectedData$Voltage <- as.numeric(selectedData$Voltage)


selectedData$Sub_metering_1 <- as.numeric(selectedData$Sub_metering_1)
selectedData$Sub_metering_2 <- as.numeric(selectedData$Sub_metering_2)
selectedData$Sub_metering_3 <- as.numeric(selectedData$Sub_metering_3)

selectedData$Global_reactive_power <- as.numeric(selectedData$Global_reactive_power)


## Combine the date and time into one single column
selectedData$newCol <- paste(selectedData$Date, selectedData$Time)

## convert the datatype of newCol as Date

selectedData$newCol <- as.POSIXlt(selectedData$newCol)


png(filename = "Plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 
with(selectedData, {
	plot(newCol, Global_active_power, type = "l", ylab = "Global Active Power")
	plot(newCol, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
	plot(newCol, Sub_metering_1, type = "l", col = "black" , ylim=c(0,40), ylab = "Energy sub metering")
     lines(newCol, Sub_metering_2, col = "red")
     lines(newCol, Sub_metering_3, col = "blue")
     
     legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
     plot(newCol, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" )
	})
dev.off()







