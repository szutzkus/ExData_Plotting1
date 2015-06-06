plot4 <- function(fn = "household_power_consumption.txt", dates = "('1/2/2007','2/2/2007')", target = "plot4.png") {
  # data
  library(sqldf)
  sqlstatement = paste("select * from file where Date in ",dates)
  hpc <- read.csv.sql(fn, header = TRUE, sep = ";", sql = sqlstatement)    
  
  # plot4
  # setup
  png(target, 480, 480)
  par(mfrow=c(2,2), mar = c(4,4,5,2)) # set par after opening file!  
  
  
  with(hpc, {
    
    # part 1 (analog to plot2.png)
    plot(hpc$Global_active_power,  type = "l", xaxt="n", ylab = "Global Active Power", xlab = " ")
    
    atv=c(0,nrow(hpc)/2,nrow(hpc))
    l=c("Thu","Fri","Sat")
    axis(side=1, at=atv, labels = l)

    # part 2
    plot(hpc$Voltage,  type = "l", xaxt="n", ylab = "Voltage", xlab = "datetime")
    
    atv=c(0,nrow(hpc)/2,nrow(hpc))
    l=c("Thu","Fri","Sat")
    axis(side=1, at=atv, labels = l)
    
    # part 3 (analot to plot3.png without border line for legend)
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
           col = c("grey", "red", "blue"), lty=1, bty="n", cex=0.9)
    
    # part 4  
    plot(hpc$Global_reactive_power,  type = "l", xaxt="n", ylab = "Global_reactive_power", xlab = "datetime")
    
    atv=c(0,nrow(hpc)/2,nrow(hpc))
    l=c("Thu","Fri","Sat")
    axis(side=1, at=atv, labels = l)
  })
  
  dev.off()
  
}