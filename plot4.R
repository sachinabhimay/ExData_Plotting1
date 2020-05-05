## reading data from household_power_consumption.txt
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## changeing classes of columns
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data[,3:8] <- sapply(data[,3:8],as.numeric)

## subsetting dataset as per date
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## creating png image
png("plot4.png", width = 480, height = 480, units = "px")

## setting global varibale for 4 plots in same image
par(mfcol = c(2,2))

## plot 1
plot(data2$Global_active_power, type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, at = c(1, as.numeric(nrow(data2)/2),nrow(data2)), labels = c("Thu", "Fri", "Sat"))

## plot 2
with(data2, {
  plot(Sub_metering_1, type = "n",xaxt = "n", ylab = "Energy sub metering", xlab = "")
  points(Sub_metering_1, col = "black", type = "l")
  points(Sub_metering_2, col = "red" ,type = "l" )
  points(Sub_metering_3, col = "blue" , type = "l")
})
axis(1, at = c(1, as.numeric(nrow(data2)/2),nrow(data2)), labels = c("Thu", "Fri", "Sat"))
color <- c("black", "red", "blue")
legend_lables <-  c("Sub_metering_1","Sub_metering_2","Sub_metering_2")
legend("topright", lty = 1, lwd = 1 ,col = color ,bg = "transparent",box.col = "transparent",box.lwd = 0,legend = legend_lables)

## plot 3
plot(data2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = c(1, as.numeric(nrow(data2)/2),nrow(data2)), labels = c("Thu", "Fri", "Sat"))

## plot 4
plot(data2$Global_reactive_power, type = "l", xlab = "datetime",ylab = "Global_reactive_power", xaxt = "n")
axis(1, at = c(1, as.numeric(nrow(data2)/2),nrow(data2)), labels = c("Thu", "Fri", "Sat"))

dev.off()