
#Plot 2

#Read and Subset the file
filename = "household_power_consumption.txt"

household_power_consumption <- read.csv(file = paste0("./", filename), sep=";",header = TRUE, quote = ";", stringsAsFactors = FALSE)

sample = household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]


#Plotting to png file
png(filename = "plot2.png", width = 480, height = 480)

#Joining Date and Time into a single variable
datetime <- strptime(paste(sample$Date, sample$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(x = datetime,y = as.numeric(sample$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()