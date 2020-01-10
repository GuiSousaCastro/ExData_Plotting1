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

plot(datetime,globalActivePower
     , type = "l"
     , xlab=""
     , ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
