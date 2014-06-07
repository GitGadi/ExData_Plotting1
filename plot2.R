## READ DATA
Sys.setlocale("LC_TIME", "ENGLISH")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors=FALSE) 
#FILTER IRRELEVANT DAYS
dataf <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Set time date in new column
dataf <- within(dataf,DateTime <- as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#Plot2
par(mfrow = c(1,1))
plot(dataf$DateTime,as.numeric(dataf$Global_active_power),type="l",
     ylab="Global Active Power (killowatts)",xlab="")

#Copy to PNG file
dev.copy(png,file="plot2.png")
dev.off()