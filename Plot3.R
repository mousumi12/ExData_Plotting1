## Read the data and load into mydata

mydata <- read.table("household_power_consumption.txt", header = T, sep = ";")

## convert the Date variable from Factor to Date class
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

## slect those rows for specific dates 2007-02-01 and  2007-02-02
selectedData <- mydata[mydata$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]


#Plot 3

## convert the "Sub_metering_1" from factor to numeric

selectedData$Sub_metering_1 <- as.numeric(selectedData$Sub_metering_1)
selectedData$Sub_metering_2 <- as.numeric(selectedData$Sub_metering_2)
selectedData$Sub_metering_3 <- as.numeric(selectedData$Sub_metering_3)

## Combine the date and time into one single column
selectedData$newCol <- paste(selectedData$Date, selectedData$Time)

## convert the datatype of newCol as Date

selectedData$newCol <- as.POSIXlt(selectedData$newCol)


x <-  selectedData$newCol
y1 <- selectedData$Sub_metering_1
y2 <- selectedData$Sub_metering_2
y3 <- selectedData$Sub_metering_3


## open the png file to save the plot 

 png(filename = "Plot3.png", width = 480, height = 480, units = "px")
 
plot(x, y1, type = "l", col = "black" , ylim=c(0,40), ylab = "Energy sub metering")
lines(x,y2, col = "red")
lines(x,y3, col = "blue")
legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 dev.off()
 




