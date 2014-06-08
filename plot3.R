d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") ##Load the data into R 
d$Date <- as.character(d$Date) ##Turn the data into character class
d <- d[(d$Date == "1/2/2007" | d$Date == "2/2/2007"),] ##Subset the needed date
d$Time <- as.character(d$Time)
time <- d$Time
d$Time <- strptime(d$Time, "%H:%M:%S")
for (i in 1:nrow(d)){d$Time[i] <- strptime(paste(d$Date[i],time[i],sep = " "), format = "%d/%m/%Y %H:%M:%S")} ##Convert the time into the needed format
d$Date <- as.Date(d$Date, "%d/%m/%Y") ##Convert the date into the needed format
d$Global_active_power<- as.numeric(as.character(d$Global_active_power)) ##Convert the Global_active_power into numeric variable
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1)) ##Convert the Sub_metering_1 into numeric variable
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))
with(d, plot(d$Time,d$Sub_metering_1, type = "l",col = "black",ylab ="Energy sub metering",xlab = "")) ##Plot Submetering1
lines(d$Time,d$Sub_metering_2, type = "l",col = "red") ##Plot Submetering2
lines(d$Time,d$Sub_metering_3, type = "l",col = "blue") ##Plot Submetering3
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue")) ##Legend
dev.copy(png, file = "plot3.png") ##Export
dev.off()