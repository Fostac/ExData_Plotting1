
#this r Script reads a data set about a time series of household energy comsumption and makes a plot 
#about the energy consumption from 2007-02-01 to 2007-02-02

#read whole table
power_data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )

#subset needed data
power_data_cut<-power_data[c(66637:69516),]

#remove the whole table as it is not needed anymore
rm(power_data)

png(filename="plot2.png")

x<-power_data_cut$Global_active_power
y<-row.names(power_data_cut)

axis_rows<-c(66637,68077 ,69516)
axis_tags=c("Thu","Fri","Sat")

with(power_data_cut, plot(y,x,type="l", ylab="Global Active Power (kilowatts)", xaxt="n"))
axis(1, at=axis_rows, labels=axis_tags)

dev.off()

