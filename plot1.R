## Reading in the data and subsetting the specific dates

household_power_consumption <- read.csv("C:/Users/Jeannie/Desktop/Coursera/household_power_consumption.txt", sep=";", na.strings="?")
hpc1 <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007") ,]


##Saving and plotting the histogram

hist(hpc1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
png("plot1.png", width = 480, height = 480)
dev.off()
