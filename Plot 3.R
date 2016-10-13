
#Plot 3

#Read and Subset the file
filename = "household_power_consumption.txt"

household_power_consumption <- read.csv(file = paste0("./", filename), sep=";",header = TRUE, quote = ";", stringsAsFactors = FALSE)

sample = household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]


#Plotting to png file
png(filename = "plot3.png", width = 480, height = 480)

#Joining date and time into a single variable
datetime <- strptime(paste(sample$Date, sample$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(x = datetime,y = as.numeric(sample$Sub_metering_1), type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(x = datetime,y = as.numeric(sample$Sub_metering_2), type = "l", col = "red")
lines(x = datetime,y = as.numeric(sample$Sub_metering_3), type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()