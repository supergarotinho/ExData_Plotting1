## IMPORTANT: The file "household_power_consumption.txt" must be in the current dir!!

energySample <- read.csv("household_power_consumption.txt", sep = ";", colClasses=c('character','character',rep("numeric",7)), na.strings = "?")
energySample <- energySample[((energySample$Date == "1/2/2007") | (energySample$Date == "2/2/2007")),]
energySample$DateFormatted <- strptime(paste(energySample$Date,energySample$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)
## Set the plot table
## Lower some margin values to fit the plots in the screen
par(mfcol = c(2,2), mar=c(4,4,2,1))

################################
## First plot
################################
plot(energySample[,c("DateFormatted","Global_active_power")],type="l",xlab="",ylab="Global Active power")

################################
## Second plot
################################
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

################################
## Third plot
################################

plot(energySample[,c("DateFormatted","Voltage")],type="l",xlab="datetime",ylab="Voltage")

################################
## Fourth plot
################################

plot(energySample[,c("DateFormatted","Global_reactive_power")],type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
