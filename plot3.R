## Exploratory Data Analysis - Course Project 1 Plot 3 Script

        ## Read the data into R
        hpc <- read.table("household_power_consumption.txt", sep = ";", 
                          header = TRUE, stringsAsFactors = FALSE)

        ## Pull out only the 2 days that we need for the graphs
        hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]


        ## Combine the Date & Time vectors into one and convert them to 
        ## POSIXct class so that is can be manipulated
        hpc2$DateTime <- as.POSIXct(paste(hpc2$Date, hpc2$Time), 
                                    format = "%d/%m/%Y %H:%M:%S")
        ## Set the dev environment
        png(file = "plot3.png")
        
        ## Create base shell for a plot
        par(mar = c(3,5,2,4))
        plot(hpc2$DateTime, hpc2$Sub_metering_1, type = "n", xlab = "", 
             ylab = "Energy sub metering")
        
        ## Add the points
        points(hpc2$DateTime, hpc2$Sub_metering_1, type = "l")
        points(hpc2$DateTime, hpc2$Sub_metering_2, col = "red", type = "l")
        points(hpc2$DateTime, hpc2$Sub_metering_3, col = "blue", type = "l")
        
        ## Create the Legend
        legend("topright", pch = "-", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## turn off dev environment
        dev.off()