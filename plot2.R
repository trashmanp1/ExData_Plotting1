##############################################################
## read and clean data
path="/Users/pedrorebelo/Desktop"  #select the path to data
setwd(path)
data = read.table("household_power_consumption.txt",
                  header = TRUE, sep = ";",na="?",dec=".",
                  colClasses=c("character", "character", rep("numeric",7)))
d1<-as.Date("01/02/2007","%d/%m/%Y") #day one
d2<-as.Date("02/02/2007","%d/%m/%Y") #day two
tiny_data_d1<-data[as.Date(data$Date,"%d/%m/%Y")==d1,]
tiny_data_d2<-data[as.Date(data$Date,"%d/%m/%Y")==d2,]
tiny_data<-rbind(tiny_data_d1,tiny_data_d2)
##############################################################
## join time and Date in  POSIX data type t
date_<-as.Date(tiny_data$Date,"%d/%m/%Y")
time_<-tiny_data$Time
date_time<-paste(date_,time_)
t<-as.POSIXct(strptime(date_time, "%Y-%m-%d %H:%M:%S"))
## make the plot in a png 480x480, save it as plot2
y<-tiny_data$Global_active_power
png(filename = "plot2.png",width = 480, height = 480)  
plot(t,y,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
