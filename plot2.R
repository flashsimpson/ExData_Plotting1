

power<- read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors=F, header=TRUE)
power$Date<- as.Date(power$Date, format="%d/%m/%Y")

subdata <- subset( power, Date == " 2007-02-01" | Date == "2007-02-02")
subdata$DT<- paste(subdata$Date, subdata$Time)
subdata$DT<- strptime(subdata$DT, "%Y-%m-%d %H:%M:%S")

subdata$Global_active_power<- as.numeric(subdata$Global_active_power)
png(file="plot2.png")
plot(subdata$DT, subdata$Global_active_power, type="l",xlab="",  ylab="Global Active Power (kilowatts)", main="")

dev.off()
