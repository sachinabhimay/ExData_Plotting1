## reading data from household_power_consumption.txt
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## changeing classes of columns
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data[,3:8] <- sapply(data[,3:8],as.numeric)

## subsetting dataset as per date
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## saving plot in .png format
png("plot1.png", width = 480, height = 480, units = "px")
hist(data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

