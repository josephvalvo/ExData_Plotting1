## Save the file path to variable "fileLocation"
fileLocation <- "C:/Users/jvalvo/Documents/Coursera/ExploratoryData/Project1/household_power_consumption.txt"
## Read the text file into variable "hpc"
hpc <- read.table(fileLocation, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## subset the large "hpc" data table to only the dates needed 
hpcSubSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
## get the "global activ power" data from the subsetted "hpc" and convert to numeric
globalActivePower <- as.numeric(hpcSubSet$Global_active_power)
## plot out the histogram
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 
