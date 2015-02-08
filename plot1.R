# Exploratory Data Analysis
# Project 1

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

# on screen is x11() for linix systems
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power");
dev.off();
