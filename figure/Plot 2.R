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

png('plot2.png')

plot(seq(from = 1, to = nrow(dta), by = 1),dta$Global_active_power, type = "l", xaxt='n', xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1,at = 0, labels = "Thu")
axis(1,at = 1440, labels = "Fri")
axis(1,at = 2880, labels = "Sat")

dev.off()