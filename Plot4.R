epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

quaddata <- data[epcdata$Date == "1/2/2007" | data$Date == "2/2/2007", ]

quaddata$daytime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
                          quaddata$Date,quaddata$Time)

png("plot4.png")
par(mfrow = c(2,2))

plot(quaddata$daytime, quaddata$Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power", xlab = "")
axis.POSIXct(1, as.POSIXct(quaddata$daytime, origin="1970-01-01"))

plot(quaddata$daytime, quaddata$Voltage, type="l", xaxt = "n",
     ylab = "Voltage", xlab = "datetime")
axis.POSIXct(1, as.POSIXct(quaddata$daytime, origin="1970-01-01"))

plot(quaddata$daytime, quaddata$Sub_metering_1, type="l", xaxt = "n",
     ylab = "Energy sub metering", xlab = "")
lines(quaddata$daytime, quaddata$Sub_metering_2, col = "red")
lines(quaddata$daytime, quaddata$Sub_metering_3, col = "blue")
axis.POSIXct(1, as.POSIXct(quaddata$daytime, origin="1970-01-01"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(quaddata$daytime, quaddata$Global_reactive_power, type="l", xaxt = "n",
     ylab = "Global_reactive_power", xlab = "datetime")
axis.POSIXct(1, as.POSIXct(quaddata$daytime, origin="1970-01-01"))
dev.off()