powerData <- read.table("household_power_consumption.txt",sep=";",header=T)

powerData$Datetime <- paste(powerData$Date,powerData$Time," ")
powerData$Date <- as.Date(powerData$Date,"%d/%m/%Y")

power <- powerData[powerData$Date<="2007-02-02" & powerData$Date>="2007-02-01",]
power$Datetime <- strptime(power$Datetime,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
power[,3] <- as.numeric(power[,3])
plot(x=power$Datetime,y=power[,3]/500,type="l",ylab="Global Active Power (killowatts)",xlab="")

power$Voltage <- as.numeric(levels(power$Voltage)[power$Voltage])
plot(x=power$Datetime,y=power$Voltage,type="l",xlab="datetime",ylab="Voltage")

power[,7] <-  as.numeric(levels(power[,7])[power[,7]])
power[,8] <-  as.numeric(levels(power[,8])[power[,8]])
plot(x=power$Datetime,y=power[,7],type="l",ylab="Energy sub metering",xlab="")
lines(x=power$Datetime,y=power[,8],col="Red")
lines(x=power$Datetime,y=power[,9],col="Blue")
legend("topright",cex=0.45,bty="n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("Black","Red","Blue"))

power[,4] <-  as.numeric(levels(power[,4])[power[,4]])
plot(x=power$Datetime,y=power[,4],type="l",ylab="Global_reactive_power",xlab="datetime")
