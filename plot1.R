###plot1.R 


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

png("plot1.png",width=480,height=480)
with(data,
     hist(Global_active_power,main="Global Active Power",col="red",
          xlab="Global active power (kilowatts)",xlim=c(0,6)) )
dev.off()