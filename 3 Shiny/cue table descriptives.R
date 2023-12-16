####Load the data####
dat = read.csv("Data/Affordance Norms_fsg.csv")
dat2 = read.csv("Data/Cue Table.csv")

##descriptives
##Mean AFSS
mean(dat2$AFSS) #34.62
sd(dat2$AFSS)
min(dat2$AFSS)
max(dat2$AFSS)

mean(dat$AFS) #.03
sd(dat$AFS)
min(dat$AFS)
max(dat$AFS)

