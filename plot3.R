#read in and subset power using sqldf package
require("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
txt <- "household_power_consumption.txt"
power <- read.csv2.sql(txt, sql)

#reformat date and time
power$DateTime <- paste(power$Date, power$Time)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")

#create png plot
png(filename = "plot3.png", width = 480, height = 480)
plot(power$DateTime, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

#close device driver
dev.off()