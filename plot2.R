file <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character")
Date <- as.Date(file[, "Date"], format = "%d/%m/%Y")
#Time <- strptime(file[, "Time"], format = "%H:%M:%S")
Time <- file[, "Time"]
GlobalActivePower <- as.numeric(file[, "Global_active_power"])
newtable <- data.frame(Date, Time, GlobalActivePower)
active.power.data <- subset(newtable, Date >= "2007-02-01" & Date <= "2007-02-02", select = c(Time, GlobalActivePower))
with(active.power.data, plot(Time, GlobalActivePower, main = "", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()

