#Read values and prepare the dataset :
getwd()
setwd("C:/Users/Youcef/Downloads/EDA_coursera/exdata_data_household_power_consumption")

#Read the dataset "household_power_consumption.txt" and define a command "table1" to call it :
table1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".",na.string="?")#reading table, containing a header. Definition of the *.txt separator, the decimal symbol "." and the non-value strings.
head(table1)

#Create "Date1" variable with "POSIXlt" format of data :
	#Convert "Date" variable from character values to date "POSIXlt" format. Define a new variable "table1$Date1" to put new values into (without loosing original ones).
Date1 <- strptime(table1$Date,format="%d/%m/%Y")

#Make a "table2" with desired subset : Electrical Consumption between 01-02-2007 and 02-02-2007.
table2 <- subset(table1,Date1>="2007-02-01" & Date1<="2007-02-02")

attach(table2)

#Create "datetime" variable :
	#Merge the two variables of Time and date into a unique variable "datetime" and convert original "character" formats to "POSIXlt" format.
table2$datetime <- strptime(paste(table2$Date, table2$Time), format="%d/%m/%Y %H:%M:%S")

#Plot2

table2$datetime <- strptime(paste(table2$Date, table2$Time), format="%d/%m/%Y %H:%M:%S")

#Build the plot2
plot(table2$datetime,table2$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)")


#Convert plot to *.png. Create the file "plot2.png"
dev.cur()
dev.copy(png,"plot2.png",height=480,width=480)
dev.off()

detach(table2)
