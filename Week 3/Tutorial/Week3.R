setwd("~/OneDrive - University of Canberra/Semester 2/Exploratory data analysis and visualization/Week 3/Tutorial/")


install.packages("ggplot2")
library(ggplot2)



# Q1

#Q1a Read the help description of the dataset trees
?trees

#Q1b Create a histogram of the Height variable with suitable axis labels, title etc., a theme of your choice and a binwidth of 10.
ggplot(trees, aes(x=trees$Height, fill = ..count..))+
  geom_histogram(binwidth = 1)+
  xlab("Height")+
  ylab("Number of trees")+
  theme_light()

#Q1c 
# Bin is too small



library(MASS)

# Q2

# Q2a Read the help description about the “cabbages” dataset.
?cabbages


#Q2b Create histograms of the “HeadWt” and “VitC” variables in R. Describe the histograms in terms of their distributions, their implications etc.

ggplot(cabbages, aes(x=cabbages$HeadWt, fill = ..count..))+
  geom_histogram(binwidth = 0.3)+
  xlab("Weight of cabbage head")+
  ylab("Number of observation")+
  ggtitle("Distribution of head value")
  
ggplot(cabbages, aes(x=cabbages$VitC, fill = ..count..))+
  geom_histogram(binwidth = 5)+
  xlab("Ascorbic acid content, in undefined units.")+
  ylab("Number of observation")+
  ggtitle("Distribution of Ascorbic acid content")



#Q2c Compare the two histograms – are they similar in pattern? Perhaps not? Do tell.
library("dplyr")

# Q2d Wrangle the dataset and by looking at the tibbles created, generate some insight. Though this method is not visual, it encourages further plots (more on this next week). Consider grouping the dataset and using the summarise function to compare certain variables of interest, such as Vitamin C content and head weight. You could use the mutate function as well.

cabbages %>% group_by(Cult) %>% summarise(Median_Vitc = median(VitC))

cabbages %>% group_by(Cult) %>% summarise(Median_HeadWt = median(HeadWt))

cabbages %>% group_by(Cult) %>% summarise(Median_HeadWt = median(HeadWt), IQR_HeadWt = IQR(HeadWt), Mean_HeadWt = mean(HeadWt), Var_HeadWt = var(HeadWt)) 
  
# Q2e Create bar plots showing the frequency of both the Cult variable and the Date variable. What do you notice in terms of their frequencies and more specifically, the levels of each variable?

cabbages %>% group_by(Cult)

ggplot(cabbages, aes(x=Cult, fill = Cult)) + geom_bar()

ggplot(cabbages, aes(x=cabbages$Date, fill = Date)) + geom_bar()


# Q3
# 

# reading the Melbourne_housing_FULL csv file
air_quality <- read.csv("airquality.csv")
  
air_quality %>% group_by(Ozone, Temp) %>% summarise(as = median(Solar.R, na.rm = TRUE) )
  
  
