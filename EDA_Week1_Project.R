#EDA Week One Project
#if(!file.exists("exdata-data-household_power_consumption.zip")) {
#        temp <- tempfile()
#        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#        file <- unzip(temp)
#        unlink(temp)
#}
dt_all <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=FALSE)
dt_all$Date <- as.Date(dt_all$Date, format="%d/%m/%Y")
dt <- dt_all[(dt_all$Date=="2007-02-01") | (dt_all$Date=="2007-02-02"),]
dt$Time <- strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S")

#dev.off()
#graph 1
plot1<-function() {
hist(dt$Global_active_power, col="red", xlab= "Global Active Power (kilowatts)",main="Global Active Power")
}
plot1()
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
dev.off()

print("plot 1 complete")

#graph#2
plot2<-function() {
        plot(dt$Time, dt$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
}
plot2()
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
print("plot 2 complete")

#graph 3
plot3<-function(legendbox="y") {
        plot(dt$Time, dt$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(dt$Time, dt$Sub_metering_2, type="l", col="red")
        lines(dt$Time, dt$Sub_metering_3, type="l", col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),text.width = strwidth("Sub_metering_3"),lty=c(1,1),bty=legendbox,cex=0.7,xjust=1, yjust=1)
}
plot3("y")
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
print("plot 3 complete")


# graph 4
plot4<-function(){
        par(mfrow=c(2,2))
        plot2()
        plot(dt$Time, dt$Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot3("n")
        plot(dt$Time, dt$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
}
plot4()
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
print("plot 4 complete")
