##############################
## Plot 4
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
## Create 'plot4.png'

# Initiate a PNG graphics device with width and height of 480 pixels
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# split graphics device into multiple plot regions
par(mfcol = c(2,2))

# Plot A
with(power, plot(DateTime, Global_active_power, ylab = "Global Active Power",
                 xlab = "", type = "l"))
# Plot B
with(power, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering",
                 xlab = "", type = "l"))
with(power, lines(DateTime, Sub_metering_2, col = "red"))
with(power, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = rep(1, 3), bty = "n")
# Plot C
with(power, plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l"))
# Plot D
with(power, plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power",
                 xlab = "datetime", type = "l"))
# Close graphics device
dev.off()
