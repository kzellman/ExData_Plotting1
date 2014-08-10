#read in and subset data using sqldf package
require("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
txt <- "household_power_consumption.txt"
power <- read.csv2.sql(txt, sql)

#reformat date and time
power$DateTime <- paste(power$Date, power$Time)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")

#create png plot
png(filename = "plot2.png", width = 480, height = 480)
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)", main = "")

#close device driver
dev.off()