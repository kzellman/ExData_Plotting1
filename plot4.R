#read in and subset power using sqldf package
require("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
txt <- "household_power_consumption.txt"
power <- read.csv2.sql(txt, sql)

#reformat date and time
power$DateTime <- paste(power$Date, power$Time)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")

#create png plot, changing carious parameters
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Upper Left Corner
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")
# Upper Right Corner
plot(power$DateTime, power$Voltage, type = "l", xlab = "", ylab= "Voltage", main = "")
# Lower Left Corner
plot(power$DateTime, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
# Lower Right Corner
plot(power$DateTime, power$Global_reactive_power, type = "l", xlab = "", ylab= "Global_rective_power")

#close device driver
dev.off()