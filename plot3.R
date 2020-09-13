# Table
HPC <- read.table("household_power_consumption.txt", head=T, sep = ";", na.strings = "?")

# Filter data set from Feb. 1, 2007 to Feb. 2, 2007
HPC <- subset(HPC, Date == "1/2/2007" | Date == "2/2/2007")                         

# Combine Date and Time column
HPC$DateTime <- paste(HPC$Date, HPC$Time)

# Format data and time
HPC$DateTime <- strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")                     

#PLOT 3
plot(HPC$DateTime, HPC$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(HPC$DateTime, HPC$Sub_metering_2, col="red")
lines(HPC$DateTime, HPC$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)

#PNG
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
