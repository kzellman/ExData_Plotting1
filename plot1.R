#read in and subset data using sqldf package
require("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
txt <- "household_power_consumption.txt"
power <- read.csv2.sql(txt, sql)

#create png plot
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col= "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", ylim = c(0,1200))

#close device driver
dev.off()