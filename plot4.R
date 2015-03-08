##Import data
hPowerConsData <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?",  stringsAsFactors = FALSE)

##Format date
hPowerConsData$Date <- as.Date(hPowerConsData$Date, format = "%d/%m/%Y")

##Subset Req Data
hPowerConsDataReq <- subset(hPowerConsData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Remove unreq data
rm(hPowerConsData)

##Convert DateTime
dateTime <- paste(as.Date(hPowerConsDataReq$Date),hPowerConsDataReq$Time)
hPowerConsDataReq$DateTime <- as.POSIXct(dateTime)

##Creating fourth plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hPowerConsDataReq, {
        plot(Global_active_power~DateTime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~DateTime, type="l",
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~DateTime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~DateTime, col='Red')
        lines(Sub_metering_3~DateTime, col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~DateTime, type="l", 
             ylab="Global Rective Power",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()