Data<-read.delim("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = F, 
                 colClasses = c(rep("character", 9)), na.strings = "?")
Data<-(Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007", ])
Data[,3] <- as.numeric(Data[,3])
Dates <- as.POSIXct(strptime(paste(Data[,1], Data[,2]), "%d/%m/%Y %H:%M:%S"))

png(png, file = "plot2.png", units = "px", width = 480, height = 480)

plot(Dates, Data[,3], type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()