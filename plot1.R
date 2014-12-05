
power<- read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors=F, header=TRUE)
power$Date<- as.Date(power$Date, format="%d/%m/%Y")

subdata <- subset( power, Date == " 2007-02-01" | Date == "2007-02-02")

subdata$Global_active_power<- as.numeric(subdata$Global_active_power)
png(file="plot1.png")
hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

dev.off()