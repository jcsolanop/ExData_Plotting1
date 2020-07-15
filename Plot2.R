

#First we read the data and subset it to work with the dates required 
workingdata <- read.table("./datos/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selecteddata <- subset(workingdata,workingdata$Date %in% c("1/2/2007","2/2/2007"))


#we create a PNG device with the width and height requested
png("plot2.png", width=480, height=480)

#then we plot the variables date/time(merged) and global_active_power (numeric)
plot(strptime(paste(selecteddata$Date, selecteddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(selecteddata$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Finally we close the Device
dev.off()