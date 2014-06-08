Data<-read.delim("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = F, 
                 colClasses = c(rep("character", 9)), na.strings = "?")
Data<-(Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007", ])
#Data[,1] <- as.Date(Data[,1], format = "%d/%m/%Y")
Data[,9] <- as.numeric(Data[,9])
Data[,8] <- as.numeric(Data[,8])
Data[,7] <- as.numeric(Data[,7])
Dates <- as.POSIXct(strptime(paste(Data[,1], Data[,2]), "%d/%m/%Y %H:%M:%S"))

png(png, file = "plot3.png", units = "px", width = 480, height = 480)

with(Data, plot(Dates, Data[,7], type="l", col="black",
                xlab="", ylab="Energy sub metering"))
with(Data, lines(Dates, Data[,8], col="red"))
with(Data, lines(Dates, Data[,9], col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), cex=0.7,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()