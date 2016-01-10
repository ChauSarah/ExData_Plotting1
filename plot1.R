setwd("C:/Users/Sarah/Dropbox/R Tutorials/Household Power Data/")

# Load required data for the two days
data <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#plot
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
