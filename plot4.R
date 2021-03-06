##############################################################
## read and clean data
path="/Users/pedrorebelo/Desktop" #select the path to data
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
##############################################################
### make the plot4,  4 graphs in 480x480 png
png(filename = "plot4.png",width = 480, height = 480)  
par(mfrow=c(2,2))
## graph 1
y<-tiny_data$Global_active_power  
plot(t,y,type="l",xlab="",ylab="Global Active Power (kilowatts)")
## graph 2
y<-tiny_data$Voltage
plot(t,y,type="l", col="black",xlab="datetime", ylab="Voltage")
## graph 3
#the dependent variables
y1<-tiny_data$Sub_metering_1
y2<-tiny_data$Sub_metering_2
y3<-tiny_data$Sub_metering_3
# plot the variables  
plot(t, y1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(t, y2, col="red")
lines(t, y3, col="blue")
legend("topright",col=c("black", "red", "blue"),lty=1,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## graph 4
y<-tiny_data$Global_reactive_power
plot(t,y,xlab="datetime", ylab="Global_reactive_power",type="l")
dev.off()