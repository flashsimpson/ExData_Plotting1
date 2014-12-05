
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
##open png window
png(file="plot2.png")
##make plot
plot(subdata$DT, subdata$Global_active_power, type="l",xlab="",  ylab="Global Active Power (kilowatts)", main="")
##close png window
dev.off()
