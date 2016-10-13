
#Plot 1

#Change language for plotting dates to english
Sys.setlocale("LC_TIME", "English")

#Read and Subset the file
filename = "household_power_consumption.txt"
household_power_consumption <- read.csv(file = paste0("./", filename), sep=";",header = TRUE, quote = ";", stringsAsFactors = FALSE)
sample = household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]


#Plotting to png file
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(sample$Global_active_power), col = "red",main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()
