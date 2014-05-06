powerData <- read.table("household_power_consumption.txt",sep=";",header=T)

powerData$Datetime <- paste(powerData$Date,powerData$Time," ")
powerData$Date <- as.Date(powerData$Date,"%d/%m/%Y")

power <- powerData[powerData$Date<="2007-02-02" & powerData$Date>="2007-02-01",]
power$Datetime <- strptime(power$Datetime,"%d/%m/%Y %H:%M:%S")


power[,3] <- as.numeric(power[,3])

hist(power[,3]/500,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="Red")
dev.copy(png, file = "plot1.png")
dev.off()