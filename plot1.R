# Import dependencies
library(data.table)

# Config
infn <- "../household_power_consumption.txt" # extraced from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
outfn <- "Plot1.png"

# Loading data
header <- names(fread(infn, nrows = 1))
dt <- fread(infn, sep = ";", na.strings = "?", skip = "1/2/2007", nrows = 2880)
names(dt) <- header

# Plot to file
png(filename = outfn, bg = "transparent", width = 504, height = 504)
hist(dt$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()