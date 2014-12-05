## Pull in data dataframe
power<- read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors=F, header=TRUE)
## Convert Date Col to Class "Date
power$Date<- as.Date(power$Date, format="%d/%m/%Y")
## Subset based on dates
subdata <- subset( power, Date == " 2007-02-01" | Date == "2007-02-02")
## Change Global acive power col to class="numeric"
subdata$Global_active_power<- as.numeric(subdata$Global_active_power)
## open png File
png(file="plot1.png")
## print histogram to file
hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
## close png file
dev.off()