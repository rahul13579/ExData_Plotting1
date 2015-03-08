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

##Creating second plot
plot(hPowerConsDataReq$Global_active_power~hPowerConsDataReq$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()