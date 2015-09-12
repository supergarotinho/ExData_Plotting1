## IMPORTANT: The file "household_power_consumption.txt" must be in the current dir!!

energySample <- read.csv("household_power_consumption.txt", sep = ";", colClasses=c('character','character',rep("numeric",7)), na.strings = "?")
energySample <- energySample[((energySample$Date == "1/2/2007") | (energySample$Date == "2/2/2007")),]
energySample$DateFormatted <- strptime(paste(energySample$Date,energySample$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)
plot(energySample[,c("DateFormatted","Global_active_power")],type="l",xlab="",ylab="Global Active power (killowatts)")
dev.off()