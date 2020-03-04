setwd("~/OneDrive - University of Canberra/Semester 2/Exploratory data analysis and visualization/Week 2/Tutorials/")


# loading the libraries
library("MASS")


#summary for mammals

dimensionOfMammals <- dim(mammals)
titleOfMammalsDF <- names(mammals)
summary(mammals)
head(mammals)

# plotting sccatterplot for brain to body weight

plot(mammals$body,mammals$brain,main="Mammals Brain weight to body weight",  ylab="Brain Weight", xlab="Body Weight")
identify(mammals$body,mammals$brain)


#19 32 33
mammals[19,]
mammals[32,]
mammals[33,]

#plotting scatterplot for brain to body weight ration against brain weight
brainToBodyRatio <- mammals$brain / mammals$body

plot(mammals$brain,brainToBodyRatio,main="Mammals brain to body weight ratio against brain weight",  ylab="brain to body weight", xlab="Brain Weight")
identify(mammals$body,brainToBodyRatio)

#mammal with largest brain weight relative to their body weight
mammals[11,]


