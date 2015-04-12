## Plot 4: Global Active Power Over DateTime, Voltage Over DateTime, Energy Sub Metering Over DateTime, Global_reactive_power Over DateTime.                                                                                                                                                                                               
                                                                                                                                                                                                                                            
## Download the archived data file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.                                                                                                              
## and extract it in the root of the project directory. Once done you'll end up with a raw data file named household_power_consumption.txt.                                                                                                 
                                                                                                                                                                                                                                            
## Load the data into R.                                                                                                                                                                                                                    
d <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character","character","numeric",NA,NA,NA,NA,NA,NA), na.strings="?")                                                                                   
                                                                                                                                                                                                                                            
## Filter out the data for 2007/02/01 and 2007/0202.                                                                                                                                                                                        
d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]                                                                                                                                                                                        
                                                                                                                                                                                                                                            
## Create a new DateTime column that combines the Date and Time columns into a date/time stamp.                                                                                                                                             
d$DateTime <- with(d, as.POSIXct(paste(Date, Time) , format = "%e/%m/%Y %H:%M:%S"))                                                                                                                                                         
                                                                                                                                                                                                                                            
## Open the png device and point it to our file we wnt on disk.                                                                                                                                                                             
png(file="plot4.png")                                                                                                                                                                                                                       
                                                                                                                                                                                                                                            
## Plot a line chart of the Global Active Power over DateTimWrite failed: Broken pipe                                                                                                                                                       
par(mfrow = c(2, 2))
with(d, {
         plot(Global_active_power ~ DateTime, xlab="", ylab="Global Active Power", type="l")
         plot(Voltage ~ DateTime, xlab="datetime", ylab="Voltage", type="l")
         plot(Sub_metering_1 ~ DateTime, xlab="", ylab="Energy sub metering", type="l")
         lines(Sub_metering_2 ~ DateTime, col="red")
         lines(Sub_metering_3 ~ DateTime, col="blue")
         legend("topright", lwd=1, bty="n", pch=c(NA, NA, NA), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), merge=FALSE)
         plot(Global_reactive_power ~ DateTime, xlab="datetime", ylab="Global_reactive_power", type="l")
})

## Close the graphics device to write the PNG data to file.                                                                                                                                                                                 
dev.off()                                                                                                                                                                                                                                   
