#read data in the working directory
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";",dec=".")

#subset data according to the data range
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#assign the global active power data to a varible
globalActivePower <- as.numeric(data_sub$Global_active_power)

#assign the voltage data to a varible
voltage <- as.numeric(data_sub$Voltage)

#assign the global sub metering data to varibles
energySubMetering1 <- as.numeric(data_sub$Sub_metering_1)
energySubMetering2 <- as.numeric(data_sub$Sub_metering_2)
energySubMetering3 <- as.numeric(data_sub$Sub_metering_3)

#assign the global reactive power data to a varible
globalReactivePower <- as.numeric(data_sub$Global_reactive_power)

#assign the time to a variable
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create .png file
png("plot4.png", width=480, height=480)

#arrange the plots
par(mfrow = c(2, 2)) 

#plot the data
plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power")
plot(datetime,voltage,type="l",xlab="",ylab="Voltage")
plot(datetime,energySubMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, energySubMetering2, type="l", col="red")
lines(datetime, energySubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime,globalReactivePower,type="l",xlab="",ylab="Global_reactive_power")

#close the file
dev.off()
