# Read data to R object
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract data from relevant dates to R object
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine date and time to new col
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Create plot
png("plot4.png", width=480, height=480)

par(mfrow=c(2, 2))

plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_Power")

dev.off()