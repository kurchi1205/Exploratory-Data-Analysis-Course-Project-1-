plot4<-function()
{
  #Data is read
  data2<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
  #Date is formatted
  data2$Date<-as.Date(data2$Date,format = "%d/%m/%Y")
  #required rows are filtered 
  data1<-filter(data2,Date=="2007-02-02"|Date=="2007-02-01")
  #date and time are calculated and joined
  datetime<-strptime(paste(data1$Date,data1$Time),format = "%Y-%m-%d %H:%M:%S")
  #screen is partioned
  par(mfrow=c(2,2))
  #plotted
  plot(datetime,data1$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
  plot(datetime,data1$Voltage, type = "l",xlab = "datetime",ylab = "Voltage")
  plot(datetime,data1$Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub metering")
  lines(datetime,data1$Sub_metering_2,col="red")
  lines(datetime,data1$Sub_metering_3,col="blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = "solid",col =c("black","red","blue"),bty = "n" )
  plot(datetime,data1$Global_reactive_power, type = "l",xlab = "datetime",ylab = "Global_reactive_power")
  dev.copy(png, file = "plot1.png", height = 480, width = 480)
  dev.off()
}