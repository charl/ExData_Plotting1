## Plot 1: Global Active Power Histogram.

## Download the archived data file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
## and extract it in the root of the project directory. Once done you'll end up with a raw data file named household_power_consumption.txt.

## Load the data into R.
d <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character","character","numeric",NA,NA,NA,NA,NA,NA), na.strings="?")

## Filter out the data for 2007/02/01 and 2007/0202.
d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]

## Open the png device and point it to our file we wnt on disk.
png(file="plot1.png")

## Plot a histogram of the Global Active Power.
with(d, hist(d$Global <- active <- power, main="Global Active Power", xlab="Global Active Power (kilowats)", col="red"))

## Close the graphics device to write the PNG data to file.
dev.off()
