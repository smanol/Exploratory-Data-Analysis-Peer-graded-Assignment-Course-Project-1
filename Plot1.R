
#Downloading the zip files and unzipping

if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "./data/Data.zip")
unzip(zipfile = "./data/Data.zip",exdir="./data")

#Reading and subseting
ConsumptionData2<-read.table("./data/household_power_consumption.txt",header = TRUE, sep=";",as.is = TRUE, na.strings="?",stringsAsFactors=F)
Data<-ConsumptionData2[ConsumptionData2$Date %in% c("2/2/2007", "1/2/2007"),]

#Making the Histogram

hist(Data$Global_active_power, main="Global Active Power", 
     
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()