
#this r Script reads a data set about a time series of household energy comsumption and makes a plot 
#about the energy consumption from 2007-02-01 to 2007-02-02

#read whole table
power_data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )

#subset needed data
power_data_cut<-power_data[c(66637:69516),]

#remove the whole table as it is not needed anymore
rm(power_data)

png(filename="plot3.png")

x<-power_data_cut$Sub_metering_1
y<-row.names(power_data_cut)

x2<-power_data_cut$Sub_metering_2
x3<-power_data_cut$Sub_metering_3

axis_rows<-c(66637,68077 ,69516)
axis_tags=c("Thu","Fri","Sat")

plot(y,x,type="l", ylab="Energy Sub Metering", xlab="", xaxt="n", ylim = range(c(x,x3,x2)))
lines(y,x2,col="red")
lines(y,x3,col="blue")

legend("topright",legend=c("Sub_metering 1","Sub_metering 2","Sub_metering 3"), col=c("black","red", "blue"),lty=1:2, cex=0.8)

axis(1, at=axis_rows, labels=axis_tags)

dev.off()

