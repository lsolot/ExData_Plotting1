## This file will produce the plot for plot1.png

plot1 <- function() {
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
        png("./plot1.png", width = 480, height = 480)
        
        ## Plot the histogram
        hist(mypc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        
        ## Close it
        dev.off()
}