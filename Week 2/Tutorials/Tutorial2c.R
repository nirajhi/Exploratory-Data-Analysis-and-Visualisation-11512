setwd("~/OneDrive - University of Canberra/Semester 2/Exploratory data analysis and visualization/Week 2/Tutorials/")


# loading the libraries
library(dplyr)
library(naniar)

# reading the airquality.csv csv file
airqualityData <- read.csv("airquality.csv")

#attaching airquality data to dataframe
attach(airqualityData)

colSums(is.na(airqualityData))
gg_miss_var(airqualityData, show_pct = TRUE)

airquality_missing = airquality[rowSums(is.na(airqualityData))>0,]

airquality_notmissing <- airquality[rowSums(is.na(airqualityData))==0,]


#3e
averages <- airquality_notmissing %>% group_by(Month)  %>% summarise(mean_Ozone = mean(Ozone),mean_Solar.R = mean(Solar.R),mean_Wind = mean(Wind),mean_Temp = mean(Temp))
plot(averages$Month, averages$mean_Temp, ylim = c(0,100), type="l", lty=1, main="Mean temp and wind", ylab="Mean", xlab="Month")
lines(averages$Month, averages$mean_Wind, type = "l", lty=2)
legend("right",c("Mean temp (degrees F)", "Mean Wind Speed (miles/hr)"), lty=c(1,2))


#3f 
airquality_missing_Ozone <- airquality_missing[!is.na(airquality_missing$Solar.R),]

#most of june is missing an Ozone value


#3g 
airquality_Ozoneimputed <- as.data.frame(airqualityData %>% group_by(Month) %>% 
                                           mutate(Ozone = ifelse(is.na(Ozone), median(Ozone, na.rm = TRUE), Ozone)))


airquality_final <- select(airquality_Ozoneimputed, -c("Solar.R", "Month", "Day"))
  
  
  
