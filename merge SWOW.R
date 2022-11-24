####Pull SWOW Direct Association Values####
##load libraries
library(dplyr)
library(readr)

##read in data
#load swow
swow = read_delim('2 Norm Sets/strength.SWOW-EN.R1.csv',delim='\t',quote = '',escape_backslash = F,escape_double = F)

#load affordance data
affordance = read.csv("1 Affordance Data/Affordance Norms.csv")

####time to merge on cue/target!####
new_dataset = affordance %>% left_join(swow, by=c("cue","response"))
