## Read the data and load into mydata

mydata <- read.table("household_power_consumption.txt", header = T, sep = ";")

## convert the Date variable from Factor to Date class
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

## slect those rows for specific dates 2007-02-01 and  2007-02-02
selectedData <- mydata[mydata$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]


#Plot 2

## convert the "Global_active_power" from factor to numeric
selectedData$Global_active_power <- as.numeric(selectedData$Global_active_power)



## Combine the date and time into one single column
selectedData$newCol <- paste(selectedData$Date, selectedData$Time)

## convert the datatype of newCol as Date

selectedData$newCol <- as.POSIXlt(selectedData$newCol)

x <- selectedData$newCol
y <- selectedData$Global_active_power

## open the png file to save the plot 
 png(filename = "Plot2.png", width = 480, height = 480, units = "px")

 plot(x,y, type = "l" ,ylab = "Global Active Power(kilowatts)")

  dev.off()

