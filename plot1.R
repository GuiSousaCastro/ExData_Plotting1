#Load data
dataset <- read.table("household_power_consumption.txt"
                      ,header = T
                      ,sep = ";"
                      ,na.strings = "?")
#subset data
finaldata <- subset(dataset
                    ,dataset$Date =="1/2/2007" | dataset$Date == "2/2/2007")

#hist
hist(as.numeric(finaldata$Global_active_power)
     ,col = "red"
     ,main = "Global Active Power"
     ,xlab = "Global Active Power (killowatts)")

#png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

