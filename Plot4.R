
#Downloading the zip files and unzipping

if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "./data/Data.zip")
unzip(zipfile = "./data/Data.zip",exdir="./data")

#Reading and subseting
ConsumptionData2<-read.table("./data/household_power_consumption.txt",header = TRUE, sep=";",as.is = TRUE, na.strings="?",stringsAsFactors=F)
Data<-ConsumptionData2[ConsumptionData2$Date %in% c("2/2/2007", "1/2/2007"),]

## Converting dates and time

dates <- paste(as.Date(Data$Date,"%d/%m/%y"), Data$Time)

Data$DatesTimes <- as.POSIXct(dates)

#Making the Plot

par(mfcol=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(Data$Global_active_power ~ Data$DatesTimes, type="l",
     
     ylab="Global Active Power (kilowatts)", xlab="")


with(Data,{plot(Sub_metering_1~DatesTimes, type="l",ylab="Global Active Power (kilowatts",xlab=""); 
  lines(Sub_metering_2~DatesTimes,col="Red"); 
  lines(Sub_metering_3~DatesTimes,col="Blue")
})

plot(Data$Voltage~Data$DatesTimes, type="l", ylab="Voltage", xlab="datetime")
plot(Data$Global_reactive_power~Data$DatesTimes, type="l", ylab="Global_reactive_power", xlab="datetime")


## Saving to file

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()