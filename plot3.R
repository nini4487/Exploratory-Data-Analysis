Sys.setlocale("LC_TIME", "C")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?", dec=".")
str(data)

data$DateDay <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
startDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
endDate <- strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S")
SSdata <- data[data$DateDay >= startDate & data$DateDay <= endDate,]


png("plot3.png", width=480, height=480)
plot(SSdata$DateDay, SSdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(SSdata$DateDay, SSdata$Sub_metering_2, type="l", col="red")
lines(SSdata$DateDay, SSdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()