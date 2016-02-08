plot2 <- function() {
    plot(power_data$timestamp,power_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.copy(png, file="plot2.png", width=480, height=480)
    dev.off()
    
}
