# Reading the data from the source directory
powerData <- "./household_power_consumption.txt"
data <- read.table(powerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Consider the first 2-Day period in February 2007
subSetPowerdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Setting the variables to be plotted
datetime <- strptime(paste(subSetPowerdata$Date, subSetPowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetPowerdata$Global_active_power)

# Setting the resolution to 480x480 and exporting to PNG file
png("plot2.png", width=480, height=480)

# Plotting the Global minute-averaged active power in kW over a period of time  
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()