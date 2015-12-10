Sys.setlocale("LC_TIME", "C")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?", dec=".")
str(data)

data$DateDay <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
startDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
endDate <- strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S")
SSdata <- data[data$DateDay >= startDate & data$DateDay <= endDate,]

png("plot2.png", width=480, height=480)
plot(SSdata$DateDay,SSdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()