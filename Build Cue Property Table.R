####This script generate data for the cue table####
##load libraries
library(dplyr)

##load the affordance data
affordances = read.csv("1 Affordance Data/Affordance Norms.csv")

cues = unique(tolower(affordances$cue))
cues = data.frame(cues)

##now load the lexical measures
BOI = read.csv("2 Norm Sets/BOI.csv")
con = read.csv("2 Norm Sets/Concreteness.csv")
frq = read.csv("2 Norm Sets/SUBTLEX-US.csv")

###combine!
##BOI
#merge
combined = merge(cues, BOI, by.x = "cues", 
                   by.y = "Word", all.x = TRUE, all.y = FALSE)

#drop columns
combined = combined[ , -c(2, 4:6)]

colnames(combined)[2] = "BOI"

##concrete
#merge
combined2 = merge(combined, con, by.x = "cues", 
                 by.y = "Word", all.x = TRUE, all.y = FALSE)

#drop columns
combined2 = combined2[ , -c(3, 5:9)]

colnames(combined2)[3] = "Concrete"

##Freq
combined3 = merge(combined2, frq, by.x = "cues", 
                  by.y = "Word", all.x = TRUE, all.y = FALSE)

#drop columns
combined3 = combined3[ , -c(4:8, 10:11)]

colnames(combined3)[4] = "SUBTLEX"

####Write to .csv####
#write.csv(combined3, file = "Cue Table.csv", row.names = F)
