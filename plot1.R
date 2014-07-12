#####################################
## Read data
library(data.table)
#Read data only for 1st and 2nd feb 2007
# 24*60=1440 minutes per day, total 2880 records for the 2 days
data <- fread(input="household_power_consumption.txt", sep=";", nrows=2880, na.strings="?",skip="1/2/2007")
#Read column headers and assign it to data
colheaders <- fread(input="household_power_consumption.txt", sep=";", nrows=0)
setnames(data,names(colheaders))

#####################################
# Open device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
#Histogram
hist(data$Global_active_power, col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#Close device
dev.off() 