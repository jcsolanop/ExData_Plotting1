
#First we read the data and subset it to work with the dates required 
workingdata <- read.table("./datos/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selecteddata <- subset(workingdata,workingdata$Date %in% c("1/2/2007","2/2/2007"))

#we create a PNG device with the width and height requested
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#We plot the graphics 
# 1
plot(strptime(paste(selecteddata$Date, selecteddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(selecteddata$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)
# 2
plot(strptime(paste(selecteddata$Date, selecteddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(selecteddata$Voltage), type="l", xlab="datetime", ylab="Voltage")
# 3
plot(strptime(paste(selecteddata$Date, selecteddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(selecteddata$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(strptime(paste(selecteddata$Date, selecteddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(selecteddata$Sub_metering_2), type="l", col="red")
lines(strptime(paste(selecteddata$Date, selecteddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(selecteddata$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# 4
plot(strptime(paste(selecteddata$Date, selecteddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(selecteddata$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

#Finally we close the Device
dev.off()