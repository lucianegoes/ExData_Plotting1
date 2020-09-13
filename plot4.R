# Table
HPC <- read.table("household_power_consumption.txt", head=T, sep = ";", na.strings = "?")

# Filter data set from Feb. 1, 2007 to Feb. 2, 2007
HPC <- subset(HPC, Date == "1/2/2007" | Date == "2/2/2007")                         

# Combine Date and Time column
HPC$DateTime <- paste(HPC$Date, HPC$Time)

# Format data and time
HPC$DateTime <- strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")                     

#PLOT 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(HPC, {
  plot(HPC$DateTime, HPC$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(HPC$DateTime, HPC$Voltage, type="l", ylab="Voltage (volt)", xlab="")
  
  plot(HPC$DateTime, HPC$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(HPC$DateTime, HPC$Sub_metering_2, col="red")
  lines(HPC$DateTime, HPC$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(HPC$DateTime, HPC$Global_reactive_power, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

#PNG
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
