# Load the data from the txt file, using the first row as header and ; as separator. 
PowerConsumption <-read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

# Check the structure of the dataframe and convert the Date variable from factor to Date type variables
str(PowerConsumption)
PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y" )

# Subset selecting 2 days in February 2007 to analyze
PowerConsumption_sub <-   PowerConsumption[PowerConsumption$Date == "2007-02-01" | PowerConsumption$Date == "2007-02-02",]

# Convert the Global_active_power variable to numeric
PowerConsumption_sub$Global_active_power <- as.numeric(PowerConsumption_sub$Global_active_power)

# Plot the histogram of Global active Power using the Base Plotting System
with(PowerConsumption_sub, hist(Global_active_power, col = "red",
                                main = "Global Active Power",
                                xlab = "Global Active Power (kilowatts)"))

# Save the graphic to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()