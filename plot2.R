## Plot 2: Global Active Power Over DateTime.

## Download the archived data file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
## and extract it in the root of the project directory. Once done you'll end up with a raw data file named household_power_consumption.txt.

## Load the data into R.
d <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character","character","numeric",NA,NA,NA,NA,NA,NA), na.strings="?")

## Filter out the data for 2007/02/01 and 2007/0202.
d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]

## Create a new DateTime column that combines the Date and Time columns into a date/time stamp.
d$DateTime <- with(d, as.POSIXct(paste(Date, Time) , format = "%e/%m/%Y %H:%M:%S"))

## Open the png device and point it to our file we wnt on disk.
png(file="plot2.png")

## Plot a line chart of the Global Active Power over DateTime.
with(d, plot(Global_active_power ~ DateTime, xlab="", ylab="Global Active Power (kilowats)", type="l"))

## Close the graphics device to write the PNG data to file.
dev.off()
