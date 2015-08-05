data <- read.csv("../household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
bar <- subset(data, (Date=="1/2/2007") | (Date=="2/2/2007"))
bar$dt<-strptime(paste(bar$Date, bar$Time), format="%d/%m/%Y %H:%M:%S")
png ("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot (bar$dt, bar$Global_active_power, type="l", ylab="Global Active Power",xlab="")

plot (bar$dt, bar$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(bar$dt, bar$Sub_metering_2, type="l", col="red")
lines(bar$dt, bar$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"),lwd=1.5, bty="n")

plot (bar$dt, bar$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot (bar$dt, bar$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
