########## PLOT 3 ##########

#read in small amount for col classes 
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T )

classes <- sapply(initial, class)  #get col classes for reading in whole data set
classes[1:2] <- "character" #want first two to be character cols
names <- names(initial) #get col names 

#read the whole table
table <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",  col.names = names, colClasses = classes, row.names = NULL, skip = 1)

#tidy up the data
mysubset <- subset(table, table$Date %in% c("1/2/2007","2/2/2007"))

#combine date and time feilds to read with strptime
mysubset$comb <- paste(mysubset$Date, mysubset$Time)

#using strptime to convert to date R can recognize/use
mysubset$rtime <- strptime(mysubset$comb, format = "%d/%m/%Y %H:%M:%S" )



###### Creating PNG ########

# start a png image
png(file="plot3.png", width=480, height=480)

par(mfrow=c(1,1)) # we want a single plot
par(mar = c(5, 4.6, 4, 1.5))  #set margins appropriately


# create plot with one y value
plot3 <- plot(mysubset$rtime, mysubset$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering",   cex.lab = 1, cex.axis=1)

# add two more y values
lines(mysubset$rtime, mysubset$Sub_metering_2, col = "red")
lines(mysubset$rtime, mysubset$Sub_metering_3, col = "blue")

# add a ledgend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black","red","blue"), lwd = 1.5, cex=1) 

dev.off()  # close the png device at the end

