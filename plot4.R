## Pull in data dataframe
power<- read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors=F, header=TRUE)
## Convert Date Col to Class "Date"
power$Date<- as.Date(power$Date, format="%d/%m/%Y")
## Subset based on dates
subdata <- subset( power, Date == " 2007-02-01" | Date == "2007-02-02")
## create new column with joint Date-time col
subdata$DT<- paste(subdata$Date, subdata$Time)
subdata$DT<- strptime(subdata$DT, "%Y-%m-%d %H:%M:%S")
## Change Global acive power col to class="numeric"
subdata$Global_active_power<- as.numeric(subdata$Global_active_power)
## Change Sub metering cols to class="numeric"
subdata$Sub_metering_1<- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2<- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3<- as.numeric(subdata$Sub_metering_3)
##open png window
png(file="plot4.png")
##make plot
par(mfcol=c(2,2))
  with(subdata, {
plot(DT, subdata$Global_active_power, type="l",xlab="",  ylab="Global Active Power (kilowatts)", main="")
plot(DT, subdata$Sub_metering_1, type="l",xlab="",  ylab="Energy sub metering", main="")
lines(DT, subdata$Sub_metering_2, type="l",xlab="", ylab="", col="red")
lines(DT, subdata$Sub_metering_3, type="l",xlab="", ylab="", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(DT, Voltage, type="l", xlab="datetime")
plot(DT, Global_reactive_power, xlab="datetime", type="l")
})
##close png window
dev.off()