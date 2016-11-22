# Read data to R object
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract data from dates to R object
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine Date & Time data to new column
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Create plot
png("plot2.png", width=480, height=480)

plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()