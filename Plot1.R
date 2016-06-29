## Read the data and load into mydata

mydata <- read.table("household_power_consumption.txt", header = T, sep = ";")

## convert the Date variable from Factor to Date class
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

## slect those rows for specific dates 2007-02-01 and  2007-02-02
selectedData <- mydata[mydata$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]


#Plot 1

selectedData$Global_active_power <- as.numeric(selectedData$Global_active_power)

png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(selectedData$Global_active_power, xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col ="red", main = "Global Active Power" )
dev.off()






