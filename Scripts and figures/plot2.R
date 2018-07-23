plot2<-function()
{
  #Data is read
  data2<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
  #Date is formatted
  data2$Date<-as.Date(data2$Date,format = "%d/%m/%Y")
  #required rows are filtered 
  data1<-filter(data2,Date=="2007-02-02"|Date=="2007-02-01")
  #date and time are calculated and joined
  datetime<-strptime(paste(data1$Date,data1$Time),format = "%Y-%m-%d %H:%M:%S")
  #plotted
  plot(datetime,data1$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
  dev.copy(png, file = "plot1.png", height = 480, width = 480)
  dev.off()
}