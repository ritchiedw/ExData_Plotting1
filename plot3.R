plot3 <- function() {
  powerTable <- read.table("household_power_consumption.txt", header = FALSE, sep=";", skip=66637, nrows = 2880)
  header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
  colnames(powerTable) <- unlist(header)
  
  temp <- paste(powerTable$Date, powerTable$Time, sep = " ")
  temp2 <- strptime(temp, format = "%d/%m/%Y %H:%M:%S")
  powerTable$Datetime <- temp2
  
  plot(powerTable$Datetime, powerTable$Sub_metering_1, type="n", xlab="", ylab="Energy Sub Metering")
  lines(powerTable$Datetime, powerTable$Sub_metering_1, col = "black")
  lines(powerTable$Datetime, powerTable$Sub_metering_2, col = "red")
  lines(powerTable$Datetime, powerTable$Sub_metering_3, col = "blue")
  legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.copy(png, filename = "plot3.png", width = 480, height = 480, units = "px")
  dev.off()
  
}