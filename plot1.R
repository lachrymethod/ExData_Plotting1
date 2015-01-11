## Exploratory Data Analysis - Course Project 1 Plot 1 Script

        ## Read the data into R
        hpc <- read.table("household_power_consumption.txt", sep = ";", 
                          header = TRUE, stringsAsFactors = FALSE)
        
        ## Transform the Date vector to a POSIXlt class so that is can be
        ## manipulated
        hpc$Date <- strptime(hpc$Date, format = "%d/%m/%Y")
        
        ## Pull out only the 2 days that we need for the graphs
        hpc2 <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
        
        
        ## Create plot
        hist(as.numeric(hpc2$Global_active_power), main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)", col = "red")
        
        ## Copy plot to png file.
        dev.copy(png, file = "plot1.png")
        dev.off()
