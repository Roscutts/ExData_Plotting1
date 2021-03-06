###plot3.R 


### Function to read in data
readin <-function() {
  data<-read.table("./household_power_consumption.txt",header=T,sep=";",as.is=T)
  data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
  date_vals=paste(data$Date,data$Time)
  date.combined=strptime(date_vals, format="%d/%m/%Y %H:%M:%S") 
  data$Global_active_power=as.numeric(data$Global_active_power)
  return (data)
}

data<-readin()

### plot 4
png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))
plot(date.combined,data$Global_active_power,'l',ylab="Global Active power",xlab="")
plot(date.combined,data$Voltage,xlab="datetime",ylab="Voltage","l")
plot(date.combined,data$Sub_metering_1,'l',ylab="Energy sub metering", xlab="")
points(date.combined,data$Sub_metering_2,col="red","l")
points(date.combined,data$Sub_metering_3,col="blue","l")
legend("topright",legend=colnames(data)[7:9],col=c("black","red","blue"),lty=1)
plot(date.combined,data$Global_active_power,xlab="datetime",ylab="Global_active_power","l")

dev.off()