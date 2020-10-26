# Download zip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "hpc.zip")
# Unzip and get household_power_consumption.txt
unzip("hpc.zip")
# Load data as table
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Keep only data for February 1st and 2nd, 2007
data = data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
# Create a DateTime variable of POSIXct format
data$DateTime = as.POSIXct(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
# Create space for 4 plots (2x2)
par(mfcol=c(2,2))
# (1) Plot a line chart of Global Active Power over time
plot(data$DateTime, data$Global_active_power, type="l", lwd=1, ylab = "Global Active Power", xlab = "")
# (2) Plot a line chart of energy sub metering
plot(data$DateTime, data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
#     Add legend
legend("topright", lwd=1,y.intersp=0.8,bty="n", cex=0.9, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# (3) Plot a line chart for Voltage over time
plot(data$DateTime, data$Voltage, type="l", lwd=1, ylab = "Voltage", xlab = "datetime")
# (4) Plot a line chart for global reactive power over time
plot(data$DateTime, data$Global_reactive_power, type="l", lwd=1, ylab = "Global_reactive_power", xlab = "datetime")
# Save plot as 480x480 png file
dev.copy(device = png, width = 480, height = 480,  "plot4.png")
# Shut down png device - make file ready to use/view
dev.off()
