## Exploratory Data Analysis Course - Project 1
## Plot 3

## Reading data from unzipped text file

my_col <- c(rep("character", 2), rep("numeric", 7))
my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = my_col, na.strings = "?")

## Extract data for date range between 2007-02-01 and 2007-02-02

my_subset <- my_data[my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007", ]

## Convert date and time to variables

my_date <- as.Date(my_subset$Date, format = "%d/%m/%Y")
join_date_time <- paste(my_date, my_subset$Time)
my_date_time <- strptime(join_date_time, format = "%Y-%m-%d %H:%M:%S")

datafield <- cbind(my_subset, my_date_time)

## Plot "Sub metering" against "Date_Time"

png(file = "plot3.png", width = 480, height = 480, bg = "transparent")

with(datafield, {
  plot(my_date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(my_date_time, Sub_metering_2, col = "red")
  lines(my_date_time, Sub_metering_3, col = "blue")
  legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()

##############