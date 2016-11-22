# Read data to R object
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract data from needed dates to R object
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine date and time to new col
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Create histogram
png("plot1.png", width=480, height=480)

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()