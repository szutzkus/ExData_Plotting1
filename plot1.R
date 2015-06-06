plot1 <- function(fn = "household_power_consumption.txt", dates = "('1/2/2007','2/2/2007')", target = "plot1.png") {
  library(sqldf)
  sqlstatement = paste("select * from file where Date in ",dates)
  hpc <- read.csv.sql(fn, header = TRUE, sep = ";", sql = sqlstatement)

  #plot1
  png(target, 480, 480)
  
  with(hpc, hist(hpc$Global_active_power, col="red", 
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
  
  dev.off()
  
}