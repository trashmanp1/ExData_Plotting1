##############################################################
## read and clean data
path="/Users/pedrorebelo/Desktop"
setwd(path)
raw_data = read.table("household_power_consumption.txt",
                      header = TRUE, sep = ";",na="?",dec=".",
                      colClasses=c("character", "character", rep("numeric",7)))
data<-raw_data
d1<-as.Date("01/02/2007","%d/%m/%Y") #day one
d2<-as.Date("02/02/2007","%d/%m/%Y") #day two
tiny_data_d1<-data[as.Date(data$Date,"%d/%m/%Y")==d1,]
tiny_data_d2<-data[as.Date(data$Date,"%d/%m/%Y")==d2,]
tiny_data<-rbind(tiny_data_d1,tiny_data_d2)
##############################################################
## make the histogram in a png 480x480, save it as plot1
x<-tiny_data$Global_active_power
png(filename = "Plot1.png",width = 480, height = 480)  
plot1<-hist(x, xlim=c(0,6),main="Global Active Power",
             xlab="Global Active Power (Kilowatts)",
             col="red") 
dev.off()
