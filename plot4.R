## Save the file path to variable "fileLocation"
hpc <- read.table(fileLocation, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## subset the large "hpc" data table to only the dates needed 
hpcSubSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
## convert data and time to "R" date and time classes
classDateTime <- strptime(paste(hpcSubSet$Date, hpcSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## set up variables for global active/reactiv power,voltage and sub meetering 1,2,3
globalActivePower <- as.numeric(hpcSubSet$Global_active_power)
subMeter1 <- as.numeric(hpcSubSet$Sub_metering_1)
subMeter2 <- as.numeric(hpcSubSet$Sub_metering_2)
subMeter3 <- as.numeric(hpcSubSet$Sub_metering_3) 
globalReactivePower <- as.numeric(hpcSubSet$Global_reactive_power)
voltage <- as.numeric(hpcSubSet$Voltage)
## plot multiple plots together
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
## generic X-Y plots global active ower voltage and submetering1
plot(classDateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(classDateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(classDateTime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
## line plots submetering 2 and 3
lines(classDateTime, subMeter2, type="l", col="red")
lines(classDateTime, subMeter3, type="l", col="blue")
## add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
## generic X-Y plots global reaactive power
plot(classDateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 
