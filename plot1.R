file <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character")
Date <- as.Date(file[, "Date"], format = "%d/%m/%Y")
GlobalActivePower <- as.numeric(file[, "Global_active_power"])
newtable <- data.frame(Date, GlobalActivePower)
active.power.data <- subset(newtable, Date >= "2007-02-01" & Date <= "2007-02-02", select = GlobalActivePower)
with(active.power.data, hist(GlobalActivePower, col = "red1", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1300)))
dev.copy(png, file = "plot1.png")
dev.off()

