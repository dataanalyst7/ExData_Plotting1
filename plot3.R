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
#Get date time information for x axis
DateTime<- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# Open device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
#Graph
plot(x=DateTime, y=data$Sub_metering_1, type="l", 
     ylab = "Energy sub metering", xlab="")
lines(x=DateTime, data$Sub_metering_2, col="red")
lines(x=DateTime, data$Sub_metering_3, col="blue")
legend("topright",  lty= 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#Close device
dev.off() 