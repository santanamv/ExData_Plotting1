#  Santana Exploratory Data Analysis Johns Hoplins Coursera Course
# data set is from UC Davis Machine Learning website (http://archive.ics.uci.edu/ml/index.php)

#read data file

data <- read.csv('household_power_consumption.txt', header=TRUE, sep = ";")

#create a subset of the data extracting two days in February (Feb 13 to Feb 14 2007)

data_subset <- subset(data, data$Date == "13/2/2007" | data$Date == "14/2/2007")

# Formatting to make the columns numeric & format date 

data_subset$Global_active_power <- as.numeric(as.character(data_subset$Global_active_power))
data_subset$Global_reactive_power <- as.numeric(as.character(data_subset$Global_reactive_power))

data_subset$Voltage <- as.numeric(as.character(data_subset$Voltage))

data_subset$Date3 <- as.character(data_subset$Date)
data_subset$Time3<- as.character(data_subset$Time)
data_subset$datetime <- strptime(paste(data_subset$Date3, data_subset$Time3), "%d/%m/%Y %H:%M:%S")

data_subset$Sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))
data_subset$Sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))

# Plot # 4 panel view of Global Active Power data

par(mfrow = c(2,2))
par(mar = c(4,4,3,1))


png("Plot4.png", width = 480, height = 480, units = "px")

plot (x= data_subset$datetime, y = data_subset$Global_active_power,
      ylab = 'Global Active power (kilowatts)',
      xlab ='Time',
      type = "l")

plot (x= data_subset$datetime, y = data_subset$Voltage,
      ylab = 'Voltage',
      xlab ='Time',
      type = "l")

plot (x= data_subset$datetime, y = data_subset$Sub_metering_1,
      ylab = 'Energy sub metering',
      xlab ='Time',
      type = "l")
legend("topleft" , bty = "n", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex =0.45)
lines(x= data_subset$datetime, y = data_subset$Sub_metering_2, col = "red")
lines(x= data_subset$datetime, y = data_subset$Sub_metering_3, col = "blue")

plot (x= data_subset$datetime, y = data_subset$Global_reactive_power,
      ylab = 'Global Reactive Power',
      xlab ='Time',
      ylim = range(0,0.5),
      type = "l")

dev.off()

