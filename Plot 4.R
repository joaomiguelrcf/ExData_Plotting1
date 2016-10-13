
#Plot 4

#Change language for plotting dates to english
Sys.setlocale("LC_TIME", "English")

#Read and Subset the file
filename = "household_power_consumption.txt"
household_power_consumption <- read.csv(file = paste0("./", filename), sep=";",header = TRUE, quote = ";", stringsAsFactors = FALSE)
sample = household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]

#Joining Date and Time into a single variable
datetime <- strptime(paste(sample$Date, sample$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plotting to png file
png(filename = "plot4.png", width = 480, height = 480)
    
    #Set 4 plots in the image
    par(mfrow = c(2,2), lheight=.7)
    
    # 1st plot - from plot2.R
    plot(x = datetime,y = as.numeric(sample$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
    # 2nd plot
    plot(x = datetime,y = as.numeric(sample$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
    
    # 3rd plot - from plot3.R
    plot(x = datetime,y = as.numeric(sample$Sub_metering_1), type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
    lines(x = datetime,y = as.numeric(sample$Sub_metering_2), type = "l", col = "red")
    lines(x = datetime,y = as.numeric(sample$Sub_metering_3), type = "l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty="n", col=c("black", "red", "blue"))
    
    # 4th plot
    plot(x = datetime,y = as.numeric(sample$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Closing png file
dev.off()
