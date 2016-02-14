## Reading in the data and subsetting the specific dates

household_power_consumption <- read.csv("C:/Users/Jeannie/Desktop/Coursera/household_power_consumption.txt", sep=";", na.strings="?")
hpc1 <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007") ,]

## Convert Date and Time variables

names(hpc1) <- names(read.csv("household_power_consumption.txt", nrows = 1,sep = ";"))
hpc1$DateTime <- as.POSIXct(paste(hpc1$Date, hpc1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc1$Date <- as.Date(hpc1$Date, format = "%d/%m/%y")
hpc1$Time <- strptime(hpc1$Time, format = "%H:%M:%S")


##Saving and plotting all four graphs

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(hpc1$DateTime, hpc1$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power", main = "")

plot(hpc1$DateTime, hpc1$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage", main = "")

plot(hpc1$DateTime, hpc1$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", main = "")
lines(hpc1$DateTime, hpc1$Sub_metering_2, col = "red")
lines(hpc1$DateTime, hpc1$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, lty = 1, col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(hpc1$DateTime, hpc1$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power", main = "")

dev.off()



