plot2 <- function() {
  powerTable <- read.table("household_power_consumption.txt", header = FALSE, sep=";", skip=66637, nrows = 2880)
  header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
  colnames(powerTable) <- unlist(header)
  
  temp <- paste(powerTable$Date, powerTable$Time, sep = " ")
  temp2 <- strptime(temp, format = "%d/%m/%Y %H:%M:%S")
  powerTable$Datetime <- temp2
  plot(powerTable$Datetime, powerTable$Global_active_power, type="l",  xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, filename = "plot2.png", width = 480, height = 480, units = "px")
  dev.off()
}