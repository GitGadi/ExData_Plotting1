## READ DATA
Sys.setlocale("LC_TIME", "ENGLISH")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors=FALSE) 
#FILTER IRRELEVANT DAYS
dataf <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Set time date in new column
dataf <- within(dataf,DateTime <- as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#Plot 4
par(mfrow = c(2,2))
with (dataf, {
        # Graph 1
        plot(DateTime,as.numeric(Global_active_power),type="l",
             ylab="Global Active Power (killowatts)",xlab="")
        
        # Graph 2
        plot(DateTime,as.numeric(Voltage),type="l",
             ylab="Voltage",xlab="datetime")
        
        # Graph 3
        plot(DateTime,as.numeric(Sub_metering_1),type="l",
             ylab="Energy sub metering",xlab="")
        
        points(DateTime,as.numeric(Sub_metering_2),col="red",type="l")
        points(DateTime,as.numeric(Sub_metering_3),col="blue",type="l")
        
        legend("topright", lty=c(1,1), col = c("black","red","blue"), 
               legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        # Graph 4
        plot(DateTime,as.numeric(Global_reactive_power),type="l",
             ylab="Global_reactive_power",xlab="datetime")
        
})

#Plot to PNG device - just copy to PNG caused some distortion with the legend, 
#therefore we will plot again to PNG directly.
png(file="plot4.png")
par(mfrow = c(2,2))
with (dataf, {
        # Graph 1
        plot(DateTime,as.numeric(Global_active_power),type="l",
             ylab="Global Active Power (killowatts)",xlab="")
        
        # Graph 2
        plot(DateTime,as.numeric(Voltage),type="l",
             ylab="Voltage",xlab="datetime")
        
        # Graph 3
        plot(DateTime,as.numeric(Sub_metering_1),type="l",
             ylab="Energy sub metering",xlab="")
        
        points(DateTime,as.numeric(Sub_metering_2),col="red",type="l")
        points(DateTime,as.numeric(Sub_metering_3),col="blue",type="l")
        
        legend("topright", lty=c(1,1), col = c("black","red","blue"), 
               legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        # Graph 4
        plot(DateTime,as.numeric(Global_reactive_power),type="l",
             ylab="Global_reactive_power",xlab="datetime")
        
})
dev.off()