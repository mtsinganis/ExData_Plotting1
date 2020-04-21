##############################
## Plot 1
##############################

# Read "Individual household electric power consumption Data Set" .txt file into R
power <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses = c("character", "character", rep("numeric", 7)),
                   na.strings = "?")

# Convert character vectors 'Date' and 'Time' to Date/Time variables using functions
# from package'lubridate'
library(lubridate)
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)
# Subset data frame according to desired dates
power <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")


#####################
## Create 'plot1.png'

# Initiate a PNG graphics device with width and height of 480 pixels
png(filename = "plot1.png", width = 480, height = 480, units = "px")
# Plot histogram
with(power, hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)",
                 col = "red", main = "Global Active Power"))
# Close graphics device
dev.off()