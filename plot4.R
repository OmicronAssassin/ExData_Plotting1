# Reading the data from the source directory
powerData <- "./household_power_consumption.txt"
data <- read.table(powerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Consider the first 2-Day period in February 2007
subSetPowerdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Setting the variables to be plotted
datetime <- strptime(paste(subSetPowerdata$Date, subSetPowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetPowerdata$Global_active_power)
globalReactivePower <- as.numeric(subSetPowerdata$Global_reactive_power)
voltage <- as.numeric(subSetPowerdata$Voltage)
sub_Metering1 <- as.numeric(subSetPowerdata$Sub_metering_1)
sub_Metering2 <- as.numeric(subSetPowerdata$Sub_metering_2)
sub_Metering3 <- as.numeric(subSetPowerdata$Sub_metering_3)

# Setting the resolution to 480x480 and exporting to PNG file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Plotting the Global minute-averaged active power in kW over a period of time
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plotting voltage over a period of time
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plotting three energy sub metering over a period of time  
plot(datetime, sub_Metering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub_Metering2, type="l", col="red")
lines(datetime, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plotting Global reactive power over a period of time
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()