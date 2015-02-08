# Exploratory Data Analysis
# Project 1 - plot 2

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


png("plot2.png", width = 480, height = 480)
plot(datetime,  data$Global_active_power, type="l", xlab="",
     ylab="Global active power (kilowatts)");
dev.off();
