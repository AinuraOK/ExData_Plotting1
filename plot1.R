
#reading data
dataset <- read.table("household_power_consumption.txt",skip=1,sep=";")
#assigning names
names(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#reading the data from just those dates rather than reading in the entire dataset and subsetting to those dates
twodaysFeb <- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")
#reconstructing plot
hist(as.numeric(as.character(twodaysFeb$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")