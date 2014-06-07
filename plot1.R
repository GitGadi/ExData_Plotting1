## READ DATA
Sys.setlocale("LC_TIME", "ENGLISH")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors=FALSE) 
#FILTER IRRELEVANT DAYS
dataf <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Set time date in new column
dataf <- within(dataf,DateTime <- as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#Plot 1
par(mfrow = c(1,1))
hist(as.numeric(dataf$Global_active_power),main = "Global Active Power", 
     xlab="Global Active Power (killowatts)", ylab="Frequency", col = "red")
#Copy to PNG file
dev.copy(png,file="plot1.png")
dev.off()