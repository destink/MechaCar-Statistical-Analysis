library(dplyr)
library(ggplot2)
# Part 1
MechaCar_mpg <- read.csv(file='Data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) # Read MechaCar mpg csv 
pairs(MechaCar_mpg, pch = 18, col = "steelblue")
library(GGally)
ggpairs(MechaCar_mpg)
mpg <- lm(formula = mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length, data=MechaCar_mpg)
mpg_residuals = mpg$residuals # model residuals
hist(mpg_residuals) #histogram of residuals
qqnorm(mpg_residuals)# Plot the residuals
qqline(mpg_residuals) # Plot the Q-Q line
summary(mpg)
summary(mpg)$r.squared
# Part 2
Suspension_coil <- read.table(file='Data/Suspension_Coil.csv',header = TRUE, sep = ",", quote = "\"'") # Read Suspension Coil as table 
total_summary <- Suspension_coil %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Var_PSI=var(PSI),StanDev=sd(PSI))
lot_summary <- Suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Var_PSI=var(PSI),StanDev=sd(PSI))
# Part 3
t.test((Suspension_coil$PSI),mu = 1500)
t.test((subset(Suspension_coil, Manufacturing_Lot == 'Lot1')$PSI),mu = 1500)
t.test((subset(Suspension_coil, Manufacturing_Lot == 'Lot2')$PSI),mu = 1500)
t.test((subset(Suspension_coil, Manufacturing_Lot == 'Lot3')$PSI),mu = 1500)

