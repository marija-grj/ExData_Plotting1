# Download zip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "hpc.zip")
# Unzip and get household_power_consumption.txt
unzip("hpc.zip")
# Load data as table
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Keep only data for February 1st and 2nd, 2007
data = data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
# Plot histogram of the Global Active Power
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Save histogram as 480x480 png file
dev.copy(device = png, width = 480, height = 480,  "plot1.png")
# Shut down png device - make file ready to use/view
dev.off()