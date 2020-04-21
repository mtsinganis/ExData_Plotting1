##############################
## Plot 2
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
## Create 'plot2.png'

# Initiate a PNG graphics device with width and height of 480 pixels
png(filename = "plot2.png", width = 480, height = 480, units = "px")
# Plot time series as line
with(power, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)",
                 xlab = "", type = "l"))
# Close graphics device
dev.off()
