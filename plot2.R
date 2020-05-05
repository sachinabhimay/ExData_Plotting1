## reading data from household_power_consumption.txt
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## changeing classes of columns
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data[,3:8] <- sapply(data[,3:8],as.numeric)

## subsetting dataset as per date
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## saving plot
png("plot2.png", width = 480, height = 480, units = "px" )

## parameters:
## 1. type = "l" points connected with line 
## 2. xaxt = "n" not draw the x axis labels
## 3. xlab = "" empty x label

plot(data2$Global_active_power, type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")

## parameters:
## 1. 'at' specify points where labels will be written
## 2. labels specify labels to be written

axis(1, at = c(1, as.numeric(nrow(data2)/2), nrow(data2)), labels = c("Thu", "Fri", "Sat"))

## turning off png graphic devices
dev.off()