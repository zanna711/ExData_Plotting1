#read data in the working directory
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";",dec=".")

#subset data according to the data range
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#assign the global sub metering data to varibles
energySubMetering1 <- as.numeric(data_sub$Sub_metering_1)
energySubMetering2 <- as.numeric(data_sub$Sub_metering_2)
energySubMetering3 <- as.numeric(data_sub$Sub_metering_3)

#assign the time to a variable
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create .png file
png("plot3.png", width=480, height=480)

#plot the data
plot(datetime,energySubMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, energySubMetering2, type="l", col="red")
lines(datetime, energySubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#close the file
dev.off()
