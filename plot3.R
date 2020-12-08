# Load the data from the txt file, using the first row as header and ; as separator. 
PowerConsumption <-read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

# Check the structure of the dataframe and convert the Date variable from factor to Date type variables
str(PowerConsumption)
PowerConsumption$DateTime <- paste(PowerConsumption$Date, PowerConsumption$Time)
PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y" )
PowerConsumption$DateTime <- strptime(PowerConsumption$DateTime, format = "%d/%m/%Y%H:%M:%S" )

# Subset selecting 2 days in February 2007 to analyze
PowerConsumption_sub <-   PowerConsumption[PowerConsumption$Date == "2007-02-01" | PowerConsumption$Date == "2007-02-02",]

# Convert the Sub_metering_1 and Sub_metering_2 variables to numeric 
PowerConsumption_sub$Sub_metering_1 <- as.numeric(PowerConsumption_sub$Sub_metering_1)
PowerConsumption_sub$Sub_metering_2 <- as.numeric(PowerConsumption_sub$Sub_metering_2)

# Plot the time series of Energy sub metering 1,2 and 3 using the Base Plotting System
with(PowerConsumption_sub, 
     plot(DateTime, Sub_metering_1, 
          type = "l",
          xlab= "",
          ylab = "Energy sub metering"))
lines(PowerConsumption_sub$DateTime,PowerConsumption_sub$Sub_metering_2, col = "red") 
lines(PowerConsumption_sub$DateTime,PowerConsumption_sub$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save the graphic to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()