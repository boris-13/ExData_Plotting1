library(datasets)
hh<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
hh$Date <- as.Date(hh$Date, format="%d/%m/%Y")
hhsub <- subset(hh, hh$Date >= "2007-02-01" & hh$Date <= "2007-02-02")
hhsub$DateTime <- strptime(paste(hhsub$Date, hhsub$Time), "%Y-%m-%d %H:%M:%S")
with(hhsub, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(hhsub, lines(DateTime, Sub_metering_1, col="black"))
with(hhsub, lines(DateTime, Sub_metering_2, col="red"))
with(hhsub, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", pch=NA, col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,filename="plot3.png", width = 480, height = 480)
dev.off ()
