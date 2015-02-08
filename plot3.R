# Exploratory Data Analysis
# Project 1 - plot 3

# Feb 1st, 2007 starts on row 66638
# Feb 2nd, 2007 ends on row 69517

filename = "household_power_consumption.txt";
rowStart = 66638;
rowEnd = 69517;
numberRows = rowEnd-rowStart+1;

header = read.table(filename, header=TRUE, sep = ";", skip = 0, nrows = 1)
data = read.table(filename, header=FALSE, sep = ";", skip = rowStart-1, 
                  nrows = numberRows, na.strings = "?");
names(data) = names(header);

datetime = strptime(paste(data$Date, data$Time, sep = " " ), "%d/%m/%Y %H:%M:%S");


png("plot3.png", width = 480, height = 480)
par(cex=1, cex.lab=1)
plot(datetime,  data$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering");
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty  = 1, col = c("black", "red", "blue"), legend = c(names(data)[7:9]));
dev.off();
