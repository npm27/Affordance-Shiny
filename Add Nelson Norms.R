####Merge FSG and Affordances####
afs = read.csv("1 Affordance Data/Affordance Norms.csv")
fsg = read.csv("2 Norm Sets/USF FSG.csv")
sem = read.csv("2 Norm Sets/Buchanan norms.csv")

##fix column names
colnames(afs)[1] = "Cue"
colnames(afs)[2] = "Target"

colnames(fsg)[1] = "Cue"
colnames(fsg)[2] = "Target"

##fix case
fsg$Cue = tolower(fsg$Cue)
fsg$Target = tolower(fsg$Target)

##Now merge!
combined = merge(afs, fsg, by.x = c("Cue", "Target"), 
                 by.y = c("Cue", "Target"), all.x = TRUE, all.y = FALSE)

##Drop BSG and SYM Columns
combined = combined[ , -c(6:7)]

####Add the Buchanan Norms####
colnames(sem)[1] = "Cue"
colnames(sem)[2] = "Target"

combined2 = merge(combined, sem, by.x = c("Cue", "Target"), 
                 by.y = c("Cue", "Target"), all.x = TRUE, all.y = FALSE)

combined2 = combined2[ , -c(7:13)]

colnames(combined2)[6] = "COS"

#write.csv(combined2, file = "Affordance Norms_fsg.csv", row.names = F)
