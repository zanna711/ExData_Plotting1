#read data in the working directory
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";",dec=".")

#subset data according to the data range
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#assign the global active power data to a varible
globalActivePower <- as.numeric(data_sub$Global_active_power)

#create .png file
png(filename="plot1.png",width=480,height=480)

#plot the data
hist(globalActivePower,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close the file
dev.off()