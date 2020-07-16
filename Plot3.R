
#First we read the data and subset it to work with the dates required 
workingdata <- read.table("./datos/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selecteddata <- subset(workingdata,workingdata$Date %in% c("1/2/2007","2/2/2007"))

#we create a PNG device with the width and height requested
png("plot3.png", width=480, height=480)

#then we plot the variables date/time(merged) and the metering variables
plot(strptime(paste(selecteddata$Date, selecteddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(selecteddata$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(selecteddata$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(selecteddata$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()