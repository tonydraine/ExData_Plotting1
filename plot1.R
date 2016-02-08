temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
file <- unzip(temp)
unlink(temp)
 power_data <- read.table(file, header=T, sep=";")

power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
power_data <- power_data[(power_data$Date=="2007-02-01") | (power_data$Date=="2007-02-02"),]

power_data$Global_active_power <- as.numeric(as.character(power_data$Global_active_power))
power_data$Global_reactive_power <- as.numeric(as.character(power_data$Global_reactive_power))
power_data$Voltage <- as.numeric(as.character(power_data$Voltage))
power_data <- transform(power_data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
power_data$Sub_metering_1 <- as.numeric(as.character(power_data$Sub_metering_1))
power_data$Sub_metering_2 <- as.numeric(as.character(power_data$Sub_metering_2))
power_data$Sub_metering_3 <- as.numeric(as.character(power_data$Sub_metering_3))


plot1 <- function() {
    hist(power_data$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
    
    dev.copy(png, file="plot1.png", width=480, height=480)
    dev.off()
}

