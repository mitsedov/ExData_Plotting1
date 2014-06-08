d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") ##Load the data into R 
d$Date <- as.character(d$Date) ##Turn the data into character class
d <- d[(d$Date == "1/2/2007" | d$Date == "2/2/2007"),] ##Subset the needed date
d$Time <- as.character(d$Time)
time <- d$Time
d$Time <- strptime(d$Time, "%H:%M:%S")
for (i in 1:nrow(d)){d$Time[i] <- strptime(paste(d$Date[i],time[i],sep = " "), format = "%d/%m/%Y %H:%M:%S")} ##Convert the time into the needed format
d$Date <- as.Date(d$Date, "%d/%m/%Y") ##Convert the date into the needed format
d$Global_active_power<- as.numeric(as.character(d$Global_active_power)) ##Convert the Global_active_power into numeric variable
hist(d$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red") ##Build a histogram
dev.copy(png, file = "plot1.png") ##Save file
dev.off()