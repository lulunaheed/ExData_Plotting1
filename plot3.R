plot3 <- function(directory){
  library(lattice)
  
  loc <- paste(c("/Users/lilafakharzadeh/Desktop/",directory),collapse="")
  setwd(loc)
  
  dat <- read.csv("household_power_consumption.txt", sep=";")
  
  dat[,1]<-as.Date(dat[,1],format="%d/%m/%Y")
  
  subDat<-subset(dat, dat[,1] == "2007-02-01" | dat[,1]=="2007-02-02")
  
  subDat$dateTime<-paste(subDat$Date,subDat$Time)
  subDat$dateTime<-as.POSIXct(subDat$dateTime)
  
Sub_metering_1<- as.numeric(as.character(subDat$Sub_metering_1))
Sub_metering_2<- as.numeric(as.character(subDat$Sub_metering_2))
Sub_metering_3<- as.numeric(as.character(subDat$Sub_metering_3))
  
  
  with(subDat,plot(dateTime,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
  with(subDat,lines(dateTime,Sub_metering_2,type="l",col="red"))
  with(subDat,lines(dateTime,Sub_metering_3,type="l",col="blue"))
  
       
  legend("topright", lty= 1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.copy(png,file="plot3.png")
  dev.off()
}