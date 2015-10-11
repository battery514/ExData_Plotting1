epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

histdata <- data[epcdata$Date == "1/2/2007" | data$Date == "2/2/2007", ]

png("plot1.png")
hist(histdata$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()
