## This file will produce the plot for plot3.png

plot3 <- function() {
        ## Read it in
        pc <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                         na.strings = c("?"), stringsAsFactors = FALSE)
        
        ## Create a new column combining the date and time
        pc$dt <- paste(pc$Date, pc$Time, sep = " ")
        
        ## Convert it to a date time object
        pc$dt <- strptime(pc$dt, format = "%d/%m/%Y %H:%M:%S")
        
        ## Subset on the dates needed
        mypc <- subset(pc, (pc$Date == "1/2/2007" | pc$Date == "2/2/2007"))
        
        ## Open the png device
        png("./plot3.png", width = 480, height = 480)
        
        ## Plot the multi-variate graph
        plot(mypc$dt, mypc$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
        lines(mypc$dt, mypc$Sub_metering_1, col = "black")
        lines(mypc$dt, mypc$Sub_metering_2, col = "red")
        lines(mypc$dt, mypc$Sub_metering_3, col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
        
        ## Close it
        dev.off()
}