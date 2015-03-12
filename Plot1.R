# PLOT 1 : histogram x = global active power vs y = frequency

getwd()

#read in small amount for col classes 
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T ) 

classes <- sapply(initial, class)  #get col classes for reading in whole data set
classes[1:2] <- "character" #want first two to be character cols

names <- names(initial) #get col names 

#read the whole table XXX CHANGE TO FULL TABLE
table <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",  col.names = names, colClasses = classes, row.names = NULL, skip = 1)

#tidy up the data
mysubset <- subset(table, table$Date %in% c("1/2/2007","2/2/2007"))



# this is the code that creates the PNG file.
#reset the graphics device
dev.off(dev.list()["RStudioGD"])

# start a png image
png(file = "plot1.png", width=480, height=480)

par(mfrow=c(1,1)) # we want a single plot
par(mar = c(5, 4.6, 4, 1.5))  #set margins appropriately


# create plot
plot1 <- hist(mysubset$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)",  cex.main = 1.3, cex.lab = 1, cex.axis=1)

dev.off() # close graphix device

