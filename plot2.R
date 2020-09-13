# Table
HPC <- read.table("household_power_consumption.txt", head=T, sep = ";", na.strings = "?")

# Filter data set from Feb. 1, 2007 to Feb. 2, 2007
HPC <- subset(HPC, Date == "1/2/2007" | Date == "2/2/2007")                         

# Combine Date and Time column
HPC$DateTime <- paste(HPC$Date, HPC$Time)

# Format data and time
HPC$DateTime <- strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")                     

#PLOT2
plot( HPC$DateTime, HPC$Global_active_power, type="l", ylab="Global Active (kilowatts)", xlab="")  

#PNG.
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
