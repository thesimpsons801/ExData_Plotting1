## Reading in the data and subsetting the specific dates

household_power_consumption <- read.csv("C:/Users/Jeannie/Desktop/Coursera/household_power_consumption.txt", sep=";", na.strings="?")
hpc1 <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007") ,]

## Convert Date and Time variables

names(hpc1) <- names(read.csv("household_power_consumption.txt", nrows = 1,sep = ";"))
hpc1$DateTime <- as.POSIXct(paste(hpc1$Date, hpc1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc1$Date <- as.Date(hpc1$Date, format = "%d/%m/%y")
hpc1$Time <- strptime(hpc1$Time, format = "%H:%M:%S")


##Saving and plotting the line graph

png("plot2.png", width = 480, height = 480)
plot(hpc1$DateTime, hpc1$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
dev.off()


