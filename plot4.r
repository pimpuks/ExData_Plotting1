library(dplyr)
power_full <- read.csv("./household_power_consumption.txt", header=TRUE, sep =";", na.strings = "?", stringsAsFactor = FALSE)
power <- subset(power_full, Date == '1/2/2007' | Date == '2/2/2007')
dates <- power[,1]
power <- mutate(power, timestamp = as.POSIXct(strptime(paste(as.Date(power[,1], "%d/%m/%Y"), power[,2]), "%Y-%m-%d %H:%M:%S")))
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
par(mar = c(4, 4, 2, 2))
with(power, plot(timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(power, plot(timestamp, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(power, plot(timestamp, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(power, lines(timestamp, Sub_metering_2, col = "red"))
with(power, lines(timestamp, Sub_metering_3, col = "blue"))  
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n")

with(power, plot(timestamp, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()