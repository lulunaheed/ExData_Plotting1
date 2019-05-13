plot4 <- function(directory){
  library(lattice)
  
  loc <- paste(c("/Users/lilafakharzadeh/Desktop/",directory),collapse="")
  setwd(loc)
  
  dat <- read.csv("household_power_consumption.txt", sep=";")
  
  dat[,1]<-as.Date(dat[,1],format="%d/%m/%Y")
  
  subDat<-subset(dat, dat[,1] == "2007-02-01" | dat[,1]=="2007-02-02")
  
  subDat$dateTime<-paste(subDat$Date,subDat$Time)
  subDat$dateTime<-as.POSIXct(subDat$dateTime)
  
  par(mfrow=c(2,2))
  
  global_active_power<- as.numeric(as.character(subDat[,3]))
  with(subDat,plot(dateTime,global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
  
  voltage<-as.numeric(as.character(subDat$Voltage))
  with(subDat,plot(dateTime,voltage,type="l",ylab="Voltage"))
  
  Sub_metering_1<- as.numeric(as.character(subDat$Sub_metering_1))
  Sub_metering_2<- as.numeric(as.character(subDat$Sub_metering_2))
  Sub_metering_3<- as.numeric(as.character(subDat$Sub_metering_3))
  with(subDat,plot(dateTime,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
  with(subDat,lines(dateTime,Sub_metering_2,type="l",col="red"))
  with(subDat,lines(dateTime,Sub_metering_3,type="l",col="blue"))
  legend("topright", lty= 1,col=c("black","red","blue"),cex=0.4, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  global_reactive_power<- as.numeric(as.character(subDat$Global_reactive_power))
  with(subDat,plot(dateTime,global_reactive_power,type="l"))
  
  dev.copy(png,file="plot4.png")
  dev.off()
}