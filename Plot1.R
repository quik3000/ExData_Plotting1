## Exploratory Data Analysis Course - Project 1
## Plot 1

## Reading data from unzipped text file

my_col <- c(rep("character", 2), rep("numeric", 7))
my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = my_col, na.strings = "?")

## Extract data for date range between 2007-02-01 and 2007-02-02

my_subset <- my_data[my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007", ]

## Plot histogram of "Global Active Power" to graphic device (PNG)

png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(my_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

##############