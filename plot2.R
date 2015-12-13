## This file will produce the plot for plot2.png

plot2 <- function() {
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
        png("./plot2.png", width = 480, height = 480)
        
        ## Plot the graph
        plot(mypc$dt, mypc$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
        
        ## Close it
        dev.off()
}