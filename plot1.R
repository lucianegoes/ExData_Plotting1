# Table
HPC <- read.table("household_power_consumption.txt", head=T, sep = ";", na.strings = "?")

# Filter data set from Feb. 1, 2007 to Feb. 2, 2007
HPC <- subset(HPC, Date == "1/2/2007" | Date == "2/2/2007")                         

# Combine Date and Time column
HPC$DateTime <- paste(HPC$Date, HPC$Time)

# Format data and time
HPC$DateTime <- strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")                     

#PLOT 1
hist(HPC$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", ylim = c(0, 1200), xlim = c(0, 6))

#PNG.
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
