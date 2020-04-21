##############################
## Plot 3
##############################
# Read .txt file
# Read "Individual household electric power consumption Data Set" .txt file into R
power <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";",
                    colClasses = c("character", "character", rep("numeric", 7)),
                    na.strings = "?")

# Combine 'Date' and 'Time' into a new variable called 'DateTime'
power$DateTime <- paste(power$Date, power$Time)
# Convert 'DateTime' into a POSIXct object
power$DateTime <- as.POSIXct(power$DateTime, format = "%d/%m/%Y %H:%M:%S")
# Subset data frame according to desired dates
power <- subset(power, format(DateTime, "%Y-%m-%d") %in% c("2007-02-01", "2007-02-02"))

#####################
## Create 'plot3.png'

# Initiate a PNG graphics device with width and height of 480 pixels
png(filename = "plot3.png", width = 480, height = 480, units = "px")
# Plot time series as lines
with(power, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering",
                 xlab = "", type = "l"))
with(power, lines(DateTime, Sub_metering_2, col = "red"))
with(power, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = rep(1, 3))

# Close graphics device
dev.off()
