powerData <- read.table("household_power_consumption.txt",sep=";",header=T)

powerData$Datetime <- paste(powerData$Date,powerData$Time," ")
powerData$Date <- as.Date(powerData$Date,"%d/%m/%Y")

power <- powerData[powerData$Date<="2007-02-02" & powerData$Date>="2007-02-01",]
power$Datetime <- strptime(power$Datetime,"%d/%m/%Y %H:%M:%S")

power[,7] <-  as.numeric(levels(power[,7])[power[,7]])
power[,8] <-  as.numeric(levels(power[,8])[power[,8]])
plot(x=power$Datetime,y=power[,7],type="l",ylab="Energy sub metering",xlab="")
lines(x=power$Datetime,y=power[,8],col="Red")
lines(x=power$Datetime,y=power[,9],col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.8,col=c("Black","Red","Blue"))
dev.copy(png, file = "plot3.png")
dev.off()