## IMPORTANT: The file "household_power_consumption.txt" must be in the current dir!!

energySample <- read.csv("household_power_consumption.txt", sep = ";", colClasses=c('character','character',rep("numeric",7)), na.strings = "?")
energySample <- energySample[((energySample$Date == "1/2/2007") | (energySample$Date == "2/2/2007")),]
energySample$DateFormatted <- strptime(paste(energySample$Date,energySample$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)

# get the range for the x and y axis
xrange <- range(energySample$DateFormatted)
yrange <- range(energySample$Sub_metering_1)

# set up the plot 
plot(xrange, yrange, type="n", xlab="",
     ylab="Energy sub metering" ) 

# plot the lines 
lines(energySample$DateFormatted, energySample$Sub_metering_1, type="l", 
      col="black")
lines(energySample$DateFormatted, energySample$Sub_metering_2, type="l", 
      col="red") 
lines(energySample$DateFormatted, energySample$Sub_metering_3, type="l", 
      col="blue") 

# add a legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))

dev.off()