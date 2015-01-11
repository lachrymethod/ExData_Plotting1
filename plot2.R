## Exploratory Data Analysis - Course Project 1 Plot 2 Script

        ## Read the data into R
        hpc <- read.table("household_power_consumption.txt", sep = ";", 
                          header = TRUE, stringsAsFactors = FALSE)
        
        ## Pull out only the 2 days that we need for the graphs
        hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]
        
        
        ## Combine the Date & Time vectors into one and convert them to 
        ## POSIXct class so that is can be manipulated
        hpc2$DateTime <- as.POSIXct(paste(hpc2$Date, hpc2$Time), 
                                   format = "%d/%m/%Y %H:%M:%S")

        ## Set Margins
        par(mar = c(3,5,2,2))
        
        ## Create plot
        plot(hpc2$DateTime, hpc2$Global_active_power, 
             ylab = "Global Active Power (kilowatts)", xlab = "",
             type = "l")

        ## Copy plot to png file.
        dev.copy(png, file = "plot2.png")
        dev.off()
