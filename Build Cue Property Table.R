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
aoa = read.csv("2 Norm Sets/Kuperman AOA.csv")
qss = read.csv("2 Norm Sets/usf_norms set size.csv")

colnames(qss)[1] = "Word"

AFSS = affordances[ , c(1, 5)]
AFSS = unique(AFSS)

BOI$Word = tolower(BOI$Word)
con$Word = tolower(con$Word)
frq$Word = tolower(frq$Word)
aoa$Word = tolower(aoa$Word)
qss$Word = tolower(qss$Word)

#get only unique qss
qss2 = qss[ , c(1, 3)]
qss2 = unique(qss2)

##load the n's
n = read.csv("1 Affordance Data/affordance ns.csv")

n$Cue = tolower(n$Cue)

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

##Add in the n's
combined4 = merge(combined3, n, by.x = "cues", 
                  by.y = "Cue", all.x = TRUE, all.y = FALSE)

##Add in the AOAs
combined5 = merge(combined4, aoa, by.x = "cues",
                  by.y = "Word", all.x = TRUE, all.y = FALSE)

combined5 = combined5[ , -c(8:10, 12:13)]
colnames(combined5)[8] = "AoA"

##now get length
combined5$Length = nchar(combined5$cues)

##ADD AFSS
combined6 = cbind(combined5, AFSS)

#ADD qss
combined7 = merge(combined6, qss2, by.x = "cues",
                  by.y = "Word", all.x = TRUE, all.y = FALSE)

combined7 = combined7[ , -10]
  
##reorder columns (put n last)
combined7 = combined7[ , c(1, 10, 2:4, 8:9, 11, 5:7)]

colnames(combined7)[1] = "Cue"

####Write to .csv####
#write.csv(combined7, file = "Cue Table.csv", row.names = F)
