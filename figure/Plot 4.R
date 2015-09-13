dta <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#If you do not have the dplyr package installed, please install it. Otherwise, my code will not work for you!
library(dplyr)
dta <- tbl_df(dta)
df1 <- filter(dta, Date == '1/2/2007')
df2 <- filter(dta, Date == '2/2/2007')
dta <- rbind(df1, df2)
rm(df1, df2)
dta$Global_active_power <- as.numeric(as.character(dta$Global_active_power))
dta$Date <- as.Date(dta$Date, format = "%d/%m/%Y")

png('plot4.png')

par(mfrow = c(2,2), mar = c(4,4,2,1))

plot(seq(from = 1, to = nrow(dta), by = 1),dta$Global_active_power, type = "l", xaxt='n', xlab = "", ylab = "Global Active Power")
axis(1,at = 0, labels = "Thu")
axis(1,at = 1440, labels = "Fri")
axis(1,at = 2880, labels = "Sat")

plot(seq(from = 1, to = nrow(dta), by = 1),dta$Voltage, type = "l", xaxt='n', xlab = "", ylab = "Voltage")
axis(1,at = 0, labels = "Thu")
axis(1,at = 1440, labels = "Fri")
axis(1,at = 2880, labels = "Sat")

plot(seq(from = 1, to = nrow(dta), by = 1),dta$Sub_metering_1, type = "l", xaxt='n', 
     yaxt = 'n', xlab = "", ylab = "Energy sub metering", ylim = c(0,35))
axis(2, at = seq(0,35,10))
lines(seq(from = 1, to = nrow(dta), by = 1),dta$Sub_metering_2, type = "l", xaxt = 'n', xlab = "", ylab = "", col = "red")
lines(seq(from = 1, to = nrow(dta), by = 1),dta$Sub_metering_3, type = "l", xaxt = 'n', xlab = "", ylab = "", col = "blue")
axis(1,at = 0, labels = "Thu")
axis(1,at = 1440, labels = "Fri")
axis(1,at = 2880, labels = "Sat")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1), col = c("black","red","blue"), bty = "n")

plot(seq(from = 1, to = nrow(dta), by = 1),dta$Global_reactive_power, type = "l", xaxt='n', xlab = "datetime", ylab = "Global_reactive_power")
axis(1,at = 0, labels = "Thu")
axis(1,at = 1440, labels = "Fri")
axis(1,at = 2880, labels = "Sat")

dev.off()