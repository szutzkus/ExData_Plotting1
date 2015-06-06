plot3 <- function(fn = "household_power_consumption.txt", dates = "('1/2/2007','2/2/2007')", target = "plot3.png") {
  # data
  library(sqldf)
  sqlstatement = paste("select * from file where Date in ",dates)
  hpc <- read.csv.sql(fn, header = TRUE, sep = ";", sql = sqlstatement)    
  
  # plot3
  png(target, 480, 480)
  
  # data
  plot(hpc$Sub_metering_1, type="n", xaxt="n", ylab = "Energy sub metering", xlab = " ")
  lines(hpc$Sub_metering_1, col="grey")
  lines(hpc$Sub_metering_2, col="red")
  lines(hpc$Sub_metering_3, col="blue")
  
  # additional info
  atv=c(0,nrow(hpc)/2,nrow(hpc))
  l=c("Thu","Fri","Sat")
  axis(side=1, at=atv, labels = l)
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("grey", "red", "blue"), lty=1)
  
  dev.off()
  
}