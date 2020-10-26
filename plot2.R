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
# Plot a line chart of Global Active Power over time
plot(data$DateTime, data$Global_active_power, type="l", lwd=1, ylab = "Global Active Power (kilowatts)", xlab = "")
# Save plot as 480x480 png file
dev.copy(device = png, width = 480, height = 480,  "plot2.png")
# Shut down png device - make file ready to use/view
dev.off()
