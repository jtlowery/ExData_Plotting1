Data<-read.delim("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = F, 
                 colClasses = c(rep("character", 9)), na.strings = "?")
Data<-(Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007", ])

Data[,9] <- as.numeric(Data[,9])
Data[,8] <- as.numeric(Data[,8])
Data[,7] <- as.numeric(Data[,7])
Data[,3] <- as.numeric(Data[,3])
Data[,4] <- as.numeric(Data[,4])
Data[,5] <- as.numeric(Data[,5])

Dates <- as.POSIXct(strptime(paste(Data[,1], Data[,2]), "%d/%m/%Y %H:%M:%S"))

png(png, file = "plot4.png", units = "px", width = 480, height = 480)

par(mfrow=c(2,2))

with(Data, {plot(Dates, Data[,3], type="l", xlab="", ylab="Global Active Power")
            plot(Dates, Data[,5], type="l", xlab="datetime", ylab="Voltage")
            plot(Dates, Data[,7], type="l", xlab="", ylab="Energy sub metering")
            lines(Dates, Data[,8], col="red")
            lines(Dates, Data[,9], col="blue")
            legend("topright", lty=1, col = c("black", "red", "blue"), bty="n", cex=0.9,
                   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            plot(Dates, Data[,4], type="l", xlab="datetime", ylab="Global_reactive_power")})

dev.off()