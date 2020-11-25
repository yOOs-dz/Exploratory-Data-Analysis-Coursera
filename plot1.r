
#Read the main dataset and prepare plotting.
getwd()
setwd("C:/Users/Youcef/Downloads/EDA_coursera/exdata_data_household_power_consumption")

#Read the dataset "household_power_consumption.txt" file and define a command "table1" to call it.
table1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".",na.string="?")#reading table, containing a header. Definition of the *.txt separator, the decimal symbol "." and the non-value strings.
head(table1)

#Convert the variable "Date" character values to date format. For that, define a new variable "Date1" to put new values into (without loosing original ones).
Date1 <- strptime(table1$Date,format="%d/%m/%Y")

# Define the final dataset "table2" with desired subsets : Electrical Consumption between 01-02-2007 and 02-02-2007.
table2 <- subset(table1,Date1>="2007-02-01" & Date1<="2007-02-02")

#Check results by "head()" comment
head(table2)

attach(table2)
#Plot 01

#Build the histogram plot1
hist(table2$Global_active_power,col="red",main="Global Active Power",xlab ="Global Active Power (Kilowatts)")

#Converting resulted plot to *.png
dev.cur()
dev.copy(png,"plot1.png",height=480,width=480)
dev.off()
detach(table2)
