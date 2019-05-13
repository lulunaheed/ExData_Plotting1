plot1 <- function(directory){

loc <- paste(c("/Users/lilafakharzadeh/Desktop/",directory),collapse="")
setwd(loc)

dat <- read.table("household_power_consumption.txt", sep=";")

dat[,1]<-as.Date(dat[,1],format="%d/%m/%Y")

subDat<-subset(dat, dat[,1] == "2007-02-01" | dat[,1]=="2007-02-02")

subDat[,3]<- as.numeric(as.character(subDat[,3]))

global_active_power<- as.numeric(as.character(subDat[,3]))

hist(global_active_power,col='red',main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()
}