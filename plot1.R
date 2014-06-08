Data<-read.delim("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = F, 
                 colClasses = c(rep("character", 9)), na.strings = "?")
Data<-(Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007", ])
Data[,3] <- as.numeric(Data[,3])

png(png, file = "plot1.png", units = "px", width = 480, height = 480)

hist(Data[,3], freq = T, col = "red", xlab = "Global Active Power (kilowatts)",  
     ylab = "Frequency",  main = "Global Active Power")

dev.off()