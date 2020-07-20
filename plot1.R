# Reading the data from the source directory
powerData <- "./household_power_consumption.txt"
data <- read.table(powerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Consider the first 2-Day period in February 2007
subSetPowerdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Setting the variable to be plotted
globalActivepower <- as.numeric(subSetPowerdata$Global_active_power)

# Setting the resolution to 480x480 and exporting to PNG file
png("plot1.png", width=480, height=480)

# Plotting the number of households vs their Global minute-averaged active power in kW
hist(globalActivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()