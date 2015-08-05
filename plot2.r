library(dplyr)
power_full <- read.csv("./household_power_consumption.txt", header=TRUE, sep =";", na.strings = "?")
power <- subset(power_full, Date == '1/2/2007' | Date == '2/2/2007')
dates <- power[,1]
power <- mutate(power, timestamp = as.POSIXct(strptime(paste(as.Date(power[,1], "%d/%m/%Y"), power[,2]), "%Y-%m-%d %H:%M:%S")))
png(file = "plot2.png", width = 480, height = 480)
with(power, plot(timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()