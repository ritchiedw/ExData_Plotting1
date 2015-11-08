plot4 <- function() {
  powerTable <- read.table("household_power_consumption.txt", header = FALSE, sep=";", skip=66637, nrows = 2880)
  header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
  colnames(powerTable) <- unlist(header)
  
  temp <- paste(powerTable$Date, powerTable$Time, sep = " ")
  temp2 <- strptime(temp, format = "%d/%m/%Y %H:%M:%S")
  powerTable$Datetime <- temp2
  
  par(mfrow = c(2,2)) #to create a matrix of plots
  plot(powerTable$Datetime, powerTable$Global_active_power, cex.axis = 0.6, cex.lab = 0.7, type="l",  xlab="", ylab="Global Active Power")
  plot(powerTable$Datetime, powerTable$Voltage, cex.axis = 0.7, cex.lab = 0.7, type="l", xlab="datetime", ylab = "Voltage")
  
  plot(powerTable$Datetime, powerTable$Sub_metering_1, cex.axis = 0.7, cex.lab = 0.7, type="n", xlab="", ylab="Energy Sub Metering")
  lines(powerTable$Datetime, powerTable$Sub_metering_1, col = "black")
  lines(powerTable$Datetime, powerTable$Sub_metering_2, col = "red")
  lines(powerTable$Datetime, powerTable$Sub_metering_3, col = "blue")
  legend(cex=0.5, "topright", lty=1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  y <- c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6)
  
  plot(powerTable$Datetime, powerTable$Global_reactive_power, type="l", font=2, cex.axis = 0.7, cex.lab = 0.7, xlab="datetime", ylab = "Global_reactive_power", yaxt="n")
  axis(2, cex.axis = 0.7, c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6), c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5", "0.6"))

  dev.copy(png, filename = "plot4.png", width = 480, height = 480, units = "px")
  dev.off()
  
}