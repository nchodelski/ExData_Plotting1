######## PLOT 4 - grid of four plots ########

#read in small amount to get initial info
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T ) 

classes <- sapply(initial, class)  #get col classes for reading in whole data set
classes[1:2] <- "character" #want first two to be character cols
names <- names(initial) #get col names 

#read the whole table
table <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",  col.names = names, colClasses = classes, row.names = NULL, skip = 1 )

#tidy up the data
mysubset <- subset(table, table$Date %in% c("1/2/2007","2/2/2007"))

#combine date and time feilds to read with strptime
mysubset$comb <- paste(mysubset$Date, mysubset$Time)

#using strptime to convert to date R can recognize/use
mysubset$rtime <- strptime(mysubset$comb, format = "%d/%m/%Y %H:%M:%S" )



###### Creating PNG ########

# plot 4 #:  2 x 2 grid of four graphs. 

# start png image
png(file = "plot4.png", width = 480, height = 480)

# set to have 4 plots in a 2 x 2 grid
par(mfcol = c(2,2))
par(mar = c(5, 4.6, 4, 1.5))  #set margins appropriately



# plot1  line graph of  x = global active power vs y = time of day
plot(mysubset$rtime, mysubset$Global_active_power, type = "l", lwd = 1.5, ylab = "Global Active Power", xlab = "",  cex.lab = 1, cex.axis = .9)

# plot 2   Sub metering levels vs time of day
plot(mysubset$rtime, mysubset$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering",   cex.lab = 1, cex.axis = .9)
# add other lines
lines(mysubset$rtime, mysubset$Sub_metering_2, col = "red")
lines(mysubset$rtime, mysubset$Sub_metering_3, col = "blue")
legend(x = "topright", inset = 0, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black","red","blue"), lwd = 1, cex = .95, bty = "n") # border = "white", bg = "white", box.col = "white" )


# plot3
#voltage on y vs date time. axes labled, no title. black line graph
plot2 <- plot(mysubset$rtime, mysubset$Voltage, type = "l", lwd = 1.5, ylab = "Voltage", xlab = "datetime",  cex.lab = 1, cex.axis = .9)


# plot 4
#global_reactive_power vs datetime. axes labled. black line graph
plot2 <- plot(mysubset$rtime, mysubset$Global_reactive_power, type = "l", lwd = 1.25, ylab = "Global_reactive_power", xlab = "datetime",  cex.lab = 1, cex.axis = .9)


dev.off() #close png device now.

