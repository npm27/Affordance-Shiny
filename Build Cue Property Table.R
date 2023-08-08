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

AFSS = affordances[ , c(1, 4)]
AFSS = unique(AFSS)

BOI$Word = tolower(BOI$Word)
con$Word = tolower(con$Word)
frq$Word = tolower(frq$Word)
aoa$Word = tolower(aoa$Word)

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
  
##reorder columns (put n last)
combined6 = combined6[ , c(1, 11, 2:4, 8:9, 5:7)]

colnames(combined6)[1] = "Cue"

####Write to .csv####
#write.csv(combined6, file = "Cue Table.csv", row.names = F)
