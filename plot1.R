data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?", dec=".")
str(data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
startDate <- as.Date("01/02/2007", format="%d/%m/%Y")
endDate <- as.Date("02/02/2007", format="%d/%m/%Y")
SSdata <- data[data$Date >= startDate & data$Date <= endDate,]

png("plot1.png", width=480, height=480)
hist(SSdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
