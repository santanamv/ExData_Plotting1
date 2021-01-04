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

# Plot # 1 focuses on the Global Active Power

png("Plot1.png", width = 480, height = 480, units = "px")
hist(data_subset$Global_active_power, 
     main = 'Global Active Power',
     xlab = 'Global Active Power in KiloWatts',
     ylab = 'Frequency',
     ylim = range(0,1200),
     col = 'green')

dev.off()

