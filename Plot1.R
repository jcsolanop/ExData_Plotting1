
#First we read the data and subset it to work with the dates required 
workingdata <- read.table("./datos/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selecteddata <- subset(workingdata,workingdata$Date %in% c("1/2/2007","2/2/2007"))

#we create a PNG device with the width and height requested
png("plot1.png", width=480, height=480)

#Next we plot the Histogram on the device 
hist(as.numeric(selecteddata$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Finally we close the device
dev.off()