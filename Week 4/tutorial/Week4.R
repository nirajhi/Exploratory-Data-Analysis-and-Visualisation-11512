setwd("~/OneDrive - University of Canberra/Semester 2/Exploratory data analysis and visualization/Week 4/Tutorial/")

library(MASS)
library(ggplot2)

# Questions 1 

# 1 a. Read the help file about the “Cars93” dataset (?Cars93) 
?Cars93

# 1 b. Suppose you are curious about the relationship between fuel efficiency and horsepower. 
#You suspect that as the horsepower of the car increases, the fuel efficiency decreases. You want to 
# verify this with a plot. Create such a plot with informative axis labels. Interpret the plot. Does this relationship 
#change by vehicle type (perhaps use the filter() function)?

ggplot(Cars93, aes(Cars93$Horsepower, Cars93$MPG.city))+
  geom_point()+
  xlab("Horse power")+
  ylab("Miles per gallons in city")

ggplot(Cars93, aes(Cars93$Horsepower, Cars93$MPG.highway))+
  geom_point()+
  xlab("Horse power")+
  ylab("Miles per gallons in highway")

ggplot(Cars93, aes(Cars93$Horsepower, Cars93$MPG.city))+
  geom_point()+
  geom_jitter(width = 10)+
  xlab("Horse power")+
  ylab("Miles per gallons in city")+
  ggtitle("Scatter plot of fuel capacity against Horspower")


#1 c. Add a smoothed trend line as well as a smoothed trend line. Which one suits the visualisation better and why?

ggplot(Cars93, aes(Cars93$Horsepower, Cars93$MPG.city))+
  geom_point()+
  geom_smooth(method = "auto")+
  xlab("Horse power")+
  ylab("Miles per gallons in city")+
  ggtitle("Scatter plot of fuel capacity against Horspower")

ggplot(Cars93, aes(Cars93$Horsepower, Cars93$MPG.city))+
  geom_point()+
  geom_smooth(method = "lm")+
  xlab("Horse power")+
  ylab("Miles per gallons in city")+
  ggtitle("Scatter plot of fuel capacity against Horspower")


#1 d. What is the most common car manufacturer in this dataset? 
#Create a plot which shows the frequency of the top 10 manufacturers.
top_10 <- Cars93 %>% group_by(Manufacturer) %>% count() %>% arrange(-n) %>% head(10)
ggplot(top_10, aes(x=Manufacturer, y= n)) +
  geom_bar(stat="identity")


#1 e.Create a bivariate barplot which shows the median midrange price of each type of vehicle. What does this plot reveal? 
# Should we be cautious of anything? How could we resolve these cautions (how could we create a more detailed plot)?
median_price_range <- Cars93 %>% group_by(Type) %>% summarise(Median_Price = median(Price))
ggplot(median_price_range, aes(Type, Median_Price)) +
  geom_bar(stat = "identity")


#1 f. Which manufacturer is the most fuel efficient? Take fuel efficiency to be the average of the “MPG.city” and “MPG.highway” 
# variables. Create a bivariate boxplot for the five most fuel-efficient manufacturers.

fuel_efficient_manufacturer <- Cars93 %>% group_by(Manufacturer) %>% mutate(average=(MPG.city+MPG.city)/2) %>% arrange(-average) %>% head(5)

ggplot(fuel_efficient_manufacturer, aes(x=Manufacturer, y=average)) + geom_bar(stat="identity")


# Question 2
# 2 a. Read the help file on the “crabs” dataset (?crabs)
?crabs

# 2 b. Create an extended scatter plot between FL and BD. Creating meaningful titles and
# axis labels!
  ggplot(crabs, aes(x=FL,y=BD))+
    geom_point()+
    xlab("frontal lobe size (mm).")+
    ylab("body depth (mm).")+
    ggtitle("Relationship between the frontal lobe size and body depth of the crabs")

# 2 c. Now add a geom_jitter() layer, setting the width to 2. Does this help the
  # interpretability of the plot heavily? Is it required to view the actual relationship?
  #  Why or why not?
  ggplot(crabs, aes(x=FL,y=BD))+
  geom_point()+
  geom_jitter(width = 2)+
  xlab("frontal lobe size (mm).")+
  ylab("body depth (mm).")+
  ggtitle("Relationship between the frontal lobe size and body depth of the crabs")

# 2 d. Add a linear trend line. Are the two variables linearly correlated? Positive or
  #negative? Does the variation change in BD depending on FL?
  ggplot(crabs, aes(x=FL,y=BD))+
    geom_point()+
    geom_smooth(method = "lm")
    xlab("frontal lobe size (mm).")+
    ylab("body depth (mm).")+
    ggtitle("Relationship between the frontal lobe size and body depth of the crabs")
    
# 2 e. There is a function which can also help overplotting on a scatter plot when so many
    # points are on a graph you cannot tell which areas have more points and which have
    # less. Which function could help you solve such an issue?  
    
    ggplot(crabs, aes(x=FL,y=BD))+
      geom_bin2d(binwidth = .5)+
      xlab("frontal lobe size (mm).")+
      ylab("body depth (mm).")+
      ggtitle("Relationship between the frontal lobe size and body depth of the crabs")
    
# 2 f. Apply the function to a plot with the two variables CL and CW. Explain any notable
   # observations and based off the help file, try to explain the trends.
    ggplot(crabs, aes(x=CL,y=CW))+
      geom_bin2d()+
      xlab("carapace length (mm).")+
      ylab("carapace width (mm).")+
      ggtitle("Relationship between the carapace length and carapace width of the crabs")

