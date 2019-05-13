plot2 <- function(directory){
  library(lattice)
 
  loc <- paste(c("/Users/lilafakharzadeh/Desktop/",directory),collapse="")
  setwd(loc)
  
  dat <- read.csv("household_power_consumption.txt", sep=";")
  
  dat[,1]<-as.Date(dat[,1],format="%d/%m/%Y")
  
  subDat<-subset(dat, dat[,1] == "2007-02-01" | dat[,1]=="2007-02-02")
  
  subDat$dateTime<-paste(subDat$Date,subDat$Time)
  subDat$dateTime<-as.POSIXct(subDat$dateTime)
  
  global_active_power<- as.numeric(as.character(subDat[,3]))
  
  
  with(subDat,plot(dateTime,global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
  
  dev.copy(png,file="plot2.png")
  dev.off()
}