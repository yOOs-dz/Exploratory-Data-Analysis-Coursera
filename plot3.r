#Read values and prepare the dataset.
getwd()
setwd("C:/Users/Youcef/Downloads/EDA_coursera/exdata_data_household_power_consumption")

#Read the dataset "household_power_consumption.txt" and define a command "table1" to call it.
table1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".",na.string="?")#reading table, containing a header. Definition of the *.txt separator, the decimal symbol "." and the non-value strings.

head(table1)

#Convert "Date" variable from character values to date "POSIXlt" format. Define a new variable "table1$Date1" to put new values into (without loosing original ones).
Date1 <- strptime(table1$Date,format="%d/%m/%Y")

#Make a "table2" with desired subset : Electrical Consumption between 01-02-2007 and 02-02-2007.
table2 <- subset(table1,Date1>="2007-02-01" & Date1<="2007-02-02")

#Create "datetime" variable :
	#Merge the two variables of Time and date into a unique variable "datetime" and convert original "character" formats to "POSIXlt" format.
table2$datetime <- strptime(paste(table2$Date, table2$Time), format="%d/%m/%Y %H:%M:%S")

#Plot03

plot(table2$datetime,table2$Sub_metering_1,type="l",xlab="",ylab="Global_Active_Power")#put the first plot presenting Sub_metering_1 through time.
lines(table2$datetime,table2$Sub_metering_2,col="red")#Add the second plot of Sub_metering_2 variable
lines(table2$datetime,table2$Sub_metering_3,col="green") #Add th third plot of Sub_metring_3 variable.

#Add a legend.
legend("topright",lty=1,col=c("black","red","green"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.cur()

#Convert plot3 to *.png.Create the file : plot3.png
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

#detach(table2)
