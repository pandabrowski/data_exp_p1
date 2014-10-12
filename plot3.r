#load dataset
data <- read.csv("./household_power_consumption.txt" , na.strings = "?",  sep=";" , stringsAsFactors=FALSE)
#narrow to complete rows
correct <- complete.cases(data)
#convert the data
cdata <-data[correct,]
cdata$DateTime <- strptime(paste(cdata[,1], cdata[,2]), format="%d/%m/%Y %H:%M:%S")
cdata[,1] <- as.Date(cdata$Date,"%d/%m/%Y")
#cdata[,2] <- as.Date(cdata$Time,"%H:%M:%S")

#subset the data
subset_data <- subset(cdata, cdata$Date %in% as.Date(c("2007-02-01","2007-02-02")))
#convert the data
subset_data[,3] <- as.numeric(subset_data[,3])
subset_data[,4] <- as.numeric(subset_data[,4])
subset_data[,5] <- as.numeric(subset_data[,5])
subset_data[,6] <- as.numeric(subset_data[,6])
subset_data[,7] <- as.numeric(subset_data[,7])
subset_data[,8] <- as.numeric(subset_data[,8])
subset_data[,9] <- as.numeric(subset_data[,9])

#set english descriptions
Sys.setlocale("LC_TIME", "English")



plot(subset_data[,10], subset_data[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(subset_data[,10], subset_data[,8], col = "Red")
lines(subset_data[,10], subset_data[,9], col = "Blue")
legend(x="topright", legend = names(subset_data[,7:9]), col = c("Black","Red","Blue"), lwd = 2)

# Copy to PNG file for submission
dev.copy(png,file="plot3.png")

# Close device
dev.off()