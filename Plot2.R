epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

linedata <- data[epcdata$Date == "1/2/2007" | data$Date == "2/2/2007", ]

linedata$daytime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
                   linedata$Date,linedata$Time)

png("plot2.png")
plot(linedata$daytime, linedata$Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis.POSIXct(1, as.POSIXct(linedata$daytime, origin="1970-01-01"))
dev.off()