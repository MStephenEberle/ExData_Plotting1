# Read data to R object
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract data from relevant dates to R object
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine date and time to new col
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Create data plot
png("plot3.png", width=480, height=480)

plot(data$DateTime, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()