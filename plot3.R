## reading data from household_power_consumption.txt
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## changeing classes of columns
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data[,3:8] <- sapply(data[,3:8],as.numeric)

## subsetting dataset as per date
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


## creating png image
png("plot3.png", width = 480, height = 480, units = "px")

with(data2, {
  
  ## ploting data with no points
  plot(Sub_metering_1, type = "n",xaxt = "n", ylab = "Energy sub metering", xlab = "")
  
  ## ploting for sub_metering_1
  points(Sub_metering_1, col = "black", type = "l")
  
  ## plotting for sub_metering_2
  points(Sub_metering_2, col = "red" ,type = "l" )
  
  ## plotting for sub_metering_3
  points(Sub_metering_3, col = "blue" , type = "l")

  })

## adding axis
axis(1, at = c(1, as.numeric(nrow(data2)/2),nrow(data2)), labels = c("Thu", "Fri", "Sat"))

## adding legend with different values
legend("topright", lty = 1, lwd = 2 ,col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))

dev.off()