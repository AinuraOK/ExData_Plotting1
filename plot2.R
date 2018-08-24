#reading data
dataset <- read.table("household_power_consumption.txt",skip=1,sep=";")
#assigning names
names(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#reading the data from just those dates rather than reading in the entire dataset and subsetting to those dates
twodaysFeb <- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")


#converting the Date and Time variables 
twodaysFeb$Date <- as.Date(twodaysFeb$Date, format="%d/%m/%Y")
twodaysFeb$Time <- strptime(twodaysFeb$Time, format="%H:%M:%S")
twodaysFeb[1:1440,"Time"] <- format(twodaysFeb[1:1440,"Time"],"2007-02-01 %H:%M:%S")
twodaysFeb[1441:2880,"Time"] <- format(twodaysFeb[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#reconstructing plot
plot(twodaysFeb$Time,as.numeric(as.character(twodaysFeb$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
