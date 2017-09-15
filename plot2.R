#install and load required package
install.packages("lubridate")
library(lubridate)

#read data in the working directory
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";",dec=".")

#subset data according to the data range
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#assign the global active power data to a varible
globalActivePower <- as.numeric(data_sub$Global_active_power)

#assign the time to a variable
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create .png file
png("plot2.png", width=480, height=480)

#plot the data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#close the file
dev.off()

