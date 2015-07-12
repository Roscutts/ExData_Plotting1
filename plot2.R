###plot2.R 


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

png("plot2.png",width=480,height=480)
plot(date.combined,data$Global_active_power,'l',ylab="Global Active Power (kilowatts)",xlab="")
dev.off()