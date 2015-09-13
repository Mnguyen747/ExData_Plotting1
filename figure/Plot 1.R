dta <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#If you do not have the dplyr package installed, please install it. Otherwise, my code will not work for you!
library(dplyr)
dta <- tbl_df(dta)
df1 <- filter(dta, Date == '1/2/2007')
df2 <- filter(dta, Date == '2/2/2007')
dta <- rbind(df1, df2)
rm(df1, df2)
dta$Global_active_power <- as.numeric(as.character(dta$Global_active_power))

png('plot1.png')
hist(dta$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()