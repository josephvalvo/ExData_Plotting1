## Save the file path to variable "fileLocation"
fileLocation <- "C:/Users/jvalvo/Documents/Coursera/ExploratoryData/Project1/household_power_consumption.txt"
## Read the text file into variable "hpc"
hpc <- read.table(fileLocation, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## subset the large "hpc" data table to only the dates needed 
hpcSubSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
## convert data and time to "R" date and time classes
classDateTime <- strptime(paste(hpcSubSet$Date, hpcSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## set up variables for global active power and sub meetering 1,2,3
globalActivePower <- as.numeric(hpcSubSet$Global_active_power)
subMeter1 <- as.numeric(hpcSubSet$Sub_metering_1)
subMeter2 <- as.numeric(hpcSubSet$Sub_metering_2)
subMeter3 <- as.numeric(hpcSubSet$Sub_metering_3)
## plot a generc X-Y plot
png("plot3.png", width=480, height=480)
plot(classDateTime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
## add lines to the plot
lines(classDateTime, subMeter2, type="l", col="red")
lines(classDateTime, subMeter3, type="l", col="blue")
## add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()