# libraries
library(dplyr)

# read raw data
df <- read.table('./data/household_power_consumption.txt', header = T, sep = ';')

# convert columns to numbers
df[,3:8] <- sapply(df[,3:8],as.numeric)

# create a column datetime
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# only rows between 2007-02-01 and 2007-02-02
df <- filter(df, df$datetime>='2007-02-01 00:00:00' & df$datetime<'2007-02-03 00:00:00')

# create plot in png file:
png('plot2.png', height = 480, width = 480)
with(df, plot(datetime, Global_active_power, type = 'l', xlab='', ylab = 'Global Active Power (kilowatts)', main = ''))

# close file
dev.off()