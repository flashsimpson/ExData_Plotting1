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
png(file="plot3.png")
##make plot
plot(subdata$DT, subdata$Sub_metering_1, type="l",xlab="",  ylab="Energy sub metering", main="")
lines(subdata$DT, subdata$Sub_metering_2, type="l",xlab="", ylab="", col="red")
lines(subdata$DT, subdata$Sub_metering_3, type="l",xlab="", ylab="", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
##close png window
dev.off()