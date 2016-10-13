#Downloading and unzipping data

zip_filename = "exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Check for Data, Download and Unzip
if (!file.exists(zip_filename)){
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = paste0("./",zip_filename))
}

unzip(zip_filename)

#Other files can run after this