#Load data
dataset <- read.table("household_power_consumption.txt"
                      ,header = T
                      ,sep = ";"
                      ,na.strings = "?")
#subset data
finaldata <- subset(dataset
                    ,dataset$Date =="1/2/2007" | dataset$Date == "2/2/2007")

#transform data
datetime <- strptime(paste(finaldata$Date, finaldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(finaldata$Global_active_power)
subMetering1 <- as.numeric(finaldata$Sub_metering_1)
subMetering2 <- as.numeric(finaldata$Sub_metering_2)
subMetering3 <- as.numeric(finaldata$Sub_metering_3)

plot(datetime, subMetering1
     , type="l"
     , ylab="Energy Submetering"
     , xlab="")
lines(datetime, subMetering2, col = "Red", type = "l")
lines(datetime, subMetering3, col = "Blue", type = "l")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3")
       ,col = c("black","red","blue")
       ,lty = 1
       ,lwd = 2.5)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()