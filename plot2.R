## Save the file path to variable "fileLocation"
fileLocation <- "C:/Users/jvalvo/Documents/Coursera/ExploratoryData/Project1/household_power_consumption.txt"
## Read the text file into variable "hpc"
hpc <- read.table(fileLocation, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## subset the large "hpc" data table to only the dates needed 
hpcSubSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
## convert data and time to "R" date and time classes
classDateTime <- strptime(paste(hpcSubSet$Date, hpcSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## get the "global activ power" data from the subsetted "hpc" and convert to numeric
globalActivePower <- as.numeric(hpcSubSet$Global_active_power)
## Plot out a generic x-y plot  
png("plot2.png", width=480, height=480)
plot(classDateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()