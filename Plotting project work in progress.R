
#Calc memory usage

Calculating space/memory usage & Requirements
has 2,075,259 rows and 9 columns all of which are numeric data. 
1 numeric cell ~8 bytes;   1,048,576 bytes per MB
2075259 * 9 * 8 # bytes/numeric cell = 149418648 bytes
149418648 / 1048576  # bytes/mb
= 142 MB is size of data set


getwd()
setwd("/Users/Natalia/Coding/exploratory data analysis")

#read in

initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T ) 
classes <- sapply(initial, class)
classes[1:2] <- "character"

names <- names(initial)
#names <- gsub("_", "", names(initial))
names

table <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",  col.names = names, colClasses = classes, row.names = NULL, skip = 1)



#tidy up the data
mysubset <- subset(table, table$Date %in% c("1/2/2007","2/2/2007"))



<<<<<<<<<<<<<<<<<<<<<<<<<<<
# PLOT 1 : histogram x = global active power.  y = frequency? 


#read in small amount for col classes 
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T ) 

classes <- sapply(initial, class)  #get col classes for reading in whole data set
classes[1:2] <- "character" #want first two to be character cols

names <- names(initial) #get col names 

#read the whole table XXX CHANGE TO FULL TABLE
table <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",  col.names = names, colClasses = classes, row.names = NULL, skip = 66000, nrows = 20000 )

#tidy up the data
mysubset <- subset(table, table$Date %in% c("1/2/2007","2/2/2007"))


head(mysubset$Globalactivepower)
# You must also include the code that creates the PNG file.

#reset the graphics device
dev.off(dev.list()["RStudioGD"])
# start a png image
png(file="plot1.png", width=504, height=504)

par(mar = c(2, 5, 2, 3)) # margins of plot

plot1 <- hist(mysubset$Globalactivepower, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)",  cex.main = 1.3, cex.lab = 1, cex.axis=1)

dev.off()



<<<<<<<<<<<<<<<<<<<<
Plot 2: line graph thin black line, 

#read in small amount for col classes 
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T ) 

classes <- sapply(initial, class)  #get col classes for reading in whole data set
classes[1:2] <- "character" #want first two to be character cols

names <- names(initial) #get col names 

#read the whole table XXX CHANGE TO FULL TABLE
table <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",  col.names = names, colClasses = classes, row.names = NULL, skip = 66000, nrows = 20000 )

#tidy up the data
mysubset <- subset(table, table$Date %in% c("1/2/2007","2/2/2007"))

#combine date and time feilds to read with strptime
mysubset$comb <- paste(mysubset$Date, mysubset$Time)

#using strptime to convert to date R can recognize/use
mysubset$rtime <- strptime(mysubset$comb, format = "%d/%m/%Y %H:%M:%S" )


plot2 <- plot(mysubset$rtime, mysubset$Global_active_power, type = "l", lwd = 1.5, ylab = "Global Active Power (kilowatts)", xlab = "",  cex.lab = .9, cex.axis=.9)

XXXXX
# You must also include the code that creates the PNG file.

#reset the graphics device
dev.off(dev.list()["RStudioGD"])
# start a png image
png(file="XXXtitleXXX.png", width=504, height=504)
plot XXX
dev.off()

<<<<<<<<<<<<<
PLOT 3


#read in small amount for col classes 
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T ) 

classes <- sapply(initial, class)  #get col classes for reading in whole data set
classes[1:2] <- "character" #want first two to be character cols

names <- names(initial) #get col names 

#read the whole table XXX CHANGE TO FULL TABLE
table <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",  col.names = names, colClasses = classes, row.names = NULL, skip = 66000, nrows = 20000 )

#tidy up the data
mysubset <- subset(table, table$Date %in% c("1/2/2007","2/2/2007"))

#combine date and time feilds to read with strptime
mysubset$comb <- paste(mysubset$Date, mysubset$Time)

#using strptime to convert to date R can recognize/use
mysubset$rtime <- strptime(mysubset$comb, format = "%d/%m/%Y %H:%M:%S" )

plot3 <- plot(mysubset$rtime, mysubset$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering",   cex.lab = .9, cex.axis=.9)
lines(mysubset$rtime, mysubset$Sub_metering_2, col = "red")
lines(mysubset$rtime, mysubset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black","red","blue"), lwd = 1.5, cex=.85) # gives the legend lines the correct color and width

XXXXX
# You must also include the code that creates the PNG file.

#reset the graphics device
dev.off(dev.list()["RStudioGD"])
# start a png image
png(file="XXXtitleXXX.png", width=504, height=504)
plot XXX
dev.off()




<<<<<<<<<<<<<
PLOT 4

#read in small amount for col classes 
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T ) 

classes <- sapply(initial, class)  #get col classes for reading in whole data set
classes[1:2] <- "character" #want first two to be character cols

names <- names(initial) #get col names 

#read the whole table XXX CHANGE TO FULL TABLE
table <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",  col.names = names, colClasses = classes, row.names = NULL, skip = 66000, nrows = 20000 )

#tidy up the data
mysubset <- subset(table, table$Date %in% c("1/2/2007","2/2/2007"))

#combine date and time feilds to read with strptime
mysubset$comb <- paste(mysubset$Date, mysubset$Time)

#using strptime to convert to date R can recognize/use
mysubset$rtime <- strptime(mysubset$comb, format = "%d/%m/%Y %H:%M:%S" )

# set to have 4 plots in a 2 x 2 grid
par(mfcol = c(2,2))
par()$mar
par(mar = c(3, 3, 3, 5))

#plot1
plot(mysubset$time, mysubset$Global_active_power, type = "l", lwd = 1.5, ylab = "Global Active Power", xlab = "",  cex.lab = .7, cex.axis=.7)

# plot 2

#voltage on y vs date time. axes labled, no title. black line graph
plot2 <- plot(mysubset$rtime, mysubset$Voltage, type = "l", lwd = 1.5, ylab = "Voltage", xlab = "datetime",  cex.lab = .7, cex.axis=.7)

#plot3
plot(mysubset$rtime, mysubset$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering",   cex.lab = .7, cex.axis=.7)
lines(mysubset$rtime, mysubset$Sub_metering_2, col = "red")
lines(mysubset$rtime, mysubset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black","red","blue"), lwd = 1, cex=.6, border = "white", bty = "n")

# plot 4
#global_reactive_power vs datetime. axes labled. black line graph
plot2 <- plot(mysubset$rtime, mysubset$Global_reactive_power, type = "l", lwd = 1.25, ylab = "Global_reactive_power", xlab = "datetime",  cex.lab = .7, cex.axis=.7)


XXXXX
# You must also include the code that creates the PNG file.

#reset the graphics device
dev.off(dev.list()["RStudioGD"])
# start a png image
png(file="XXXtitleXXX.png", width=504, height=504)
plot XXX
dev.off()

<<<<<<<<<<<<<<<
     

strptime(mysubset$comb[1], format = "%d/%m/%Y %H:%M:%S" )
as.POSIXlt(strptime(mysubset$comb[1], format = "%d/%m/%Y %H:%M:%S" ))



head(mysubset$realtime)
as.Date(mysubset$comb[1], format = "%d/%m/%Y %H:%M:%S")

as.Date(
     ?as.Date

plot2 <- plot(mysubset$rtime, mysubset$Global_active_power, xlim = c(0,2000))

desired <- grep(NA, table, value = T, fixed = T)
desired
table(is.na(table))

     #replace any and all ? with NA's
gsub("?", NA, tabAll)
