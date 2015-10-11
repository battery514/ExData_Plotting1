epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

boxdata <- data[epcdata$Date == "1/2/2007" | data$Date == "2/2/2007", ]

boxdata$daytime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
                           boxdata$Date,boxdata$Time)

png("plot3.png")
plot(boxdata$daytime, boxdata$Sub_metering_1, type="l", xaxt = "n",
     ylab = "Energy sub metering", xlab = "")
lines(boxdata$daytime, boxdata$Sub_metering_2, col = "red")
lines(boxdata$daytime, boxdata$Sub_metering_3, col = "blue")
axis.POSIXct(1, as.POSIXct(boxdata$daytime, origin="1970-01-01"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()