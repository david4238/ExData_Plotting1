#clean all variables
rm(list=ls(all=TRUE))

#import data set
f <- read.table("../household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")

f$Date=as.Date(f$Date,format="%d/%m/%Y")
df=subset(f, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

df$Date <- as.Date(df$Date , "%d/%m/%Y")
df$Time <- paste(df$Date, df$Time, sep=" ")
df$Time <- strptime(df$Time, "%Y-%m-%d %H:%M:%S")


#plot 3
png("../plots/plot3.png", width = 480, height = 480)
ylimits = range(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3))
plot(df$Time, df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
par(new = TRUE)
plot(df$Time, df$Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
par(new = TRUE)
plot(df$Time, df$Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
legend("topright",
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty = c(1,1,1),
col = c("black", "red", "blue")
)
dev.off