#setwd("c:\\Users\\PIERROT-00178\\Desktop\\ExData_Plotting1/")
#setwd("../")
#clean all variables
rm(list=ls(all=TRUE))

#import data set
f <- read.table("../household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")

f$Date=as.Date(f$Date,format="%d/%m/%Y")
df=subset(f, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

df$Date <- as.Date(df$Date , "%d/%m/%Y")
df$Time <- paste(df$Date, df$Time, sep=" ")
df$Time <- strptime(df$Time, "%Y-%m-%d %H:%M:%S")

#ploting hist
png("../plots/plot1.png", width = 480, height = 480)
hist(df$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off
