# Import dependencies
library(data.table)

# Config
infn <- "../household_power_consumption.txt" # extraced from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
outfn <- "Plot2.png"

# Loading data
header <- names(fread(infn, nrows = 1))
dt <- fread(infn, sep = ";", na.strings = "?", skip = "1/2/2007", nrows = 2880, data.table = FALSE)
names(dt) <- header

# Merge date and time
dt$obstime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M", tz = "GMT")

# Plot to file
png(filename = outfn, bg = "transparent", width = 504, height = 504)
plot(dt$obstime, dt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
