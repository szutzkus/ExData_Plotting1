plot2 <- function(fn = "household_power_consumption.txt", dates = "('1/2/2007','2/2/2007')", target = "plot2.png") {
  # data
  library(sqldf)
  sqlstatement = paste("select * from file where Date in ",dates)
  hpc <- read.csv.sql(fn, header = TRUE, sep = ";", sql = sqlstatement)    

  # plot2
  png(target, 480, 480)
  
  plot(hpc$Global_active_power,  type = "l", xaxt="n", ylab = "Global Active Power (kilowatts)", xlab = " ")
  
  atv=c(0,nrow(hpc)/2,nrow(hpc))
  l=c("Thu","Fri","Sat")
  axis(side=1, at=atv, labels = l)
  
  dev.off()
  
}