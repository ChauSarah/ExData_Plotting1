setwd("C:/Users/Sarah/Dropbox/R Tutorials/Household Power Data/")

# Load required data for the two days
data <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# set space parameter for 4 graphs (2x2)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# plot 1
plot(data$DateTime, data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = "")

# plot 2
plot(data$DateTime, data$Voltage, type = "l", ylab="Voltage", xlab = "datetime")

# plot 3
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

# plot 4
plot(data$DateTime, data$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab = "datetime")

dev.off()