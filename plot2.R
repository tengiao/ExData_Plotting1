file <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character")
Date <- as.Date(file[, "Date"], format = "%d/%m/%Y") #Format to %Y-%m-%d
Time <- file[, "Time"]
DateTime <- paste(Date, Time)
TimeStamp <- strptime(DateTime, format = "%Y-%m-%d %H:%M:%S")
GlobalActivePower <- as.numeric(file[, "Global_active_power"])
newtable <- data.frame(Date, TimeStamp, GlobalActivePower)
newtable.sub <- subset(newtable, Date >= "2007-02-01" & Date <= "2007-02-02", select = c(TimeStamp, GlobalActivePower))
with(newtable.sub, plot(TimeStamp, GlobalActivePower, main = "", pch = ".", type = "o", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()

