# Load the data from the txt file, using the first row as header and ; as separator. 
PowerConsumption <-read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

# Check the structure of the dataframe and join together and convert the Date and Time variables from factor to a POSIXlt type variable
str(PowerConsumption)
PowerConsumption$DateTime <- paste(PowerConsumption$Date, PowerConsumption$Time)
PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y" )
PowerConsumption$DateTime <- strptime(PowerConsumption$DateTime, format = "%d/%m/%Y%H:%M:%S" )

# Subset selecting 2 days in February 2007 to analyze
PowerConsumption_sub <-   PowerConsumption[PowerConsumption$Date == "2007-02-01" | PowerConsumption$Date== "2007-02-02",]

# Convert the Global_active_power variable to numeric
PowerConsumption_sub$Global_active_power <- as.numeric(PowerConsumption_sub$Global_active_power)

# Plot the time series of Global active Power using the Base Plotting System
with(PowerConsumption_sub, plot(DateTime, Global_active_power, 
                                type = "l",
                                xlab = "", 
                                ylab = "Global Active Power (kilowatts)"))

# Save the graphic to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()