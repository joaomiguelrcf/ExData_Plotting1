#Downloading data

zip_filename = "exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Check for Data, Download and Unzip
if (!file.exists(zip_filename)){
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = paste0("./",zip_filename))
}

unzip(zip_filename)


# Loading data into R without reading the whole dataset into memory:
# This file showcases an alternative to read.csv, assuming you only
#  want to read the data from the specified dates into memory

# It uses the package "sqldf" to read the file into a temporary sql table on the hard drive,
#  query it for the specified dates and delete it afterwards, avoiding reading the whole table into
#  virtual memory.

#check and install "sqldf" package
if("sqldf" %in% rownames(installed.packages()) == FALSE) {
    install.packages("sqldf")}

require (sqldf)

filename = "household_power_consumption.txt"

#open connection
fi = file(filename)

#read data using a temporary sql table
sample = sqldf("select * from fi where Date IN ('1/2/2007','2/2/2007')", dbname = tempfile(),file.format = list(sep = ";",header = T, row.names = F))

#close connection
close(fi)
