## IMPORTANT: The file "household_power_consumption.txt" must be in the current dir!!

energySample <- read.csv("household_power_consumption.txt", sep = ";", colClasses=c('character','character',rep("numeric",7)), na.strings = "?")
energySample <- energySample[((energySample$Date == "1/2/2007") | (energySample$Date == "2/2/2007")),]

png(file = "plot1.png", width = 480, height = 480)
hist(energySample$Global_active_power, main = "Global Active power", xlab = "Global Active power (killowatts)", xlim = c(0,6), ylim = c(0,1200), col = "red")
dev.off()