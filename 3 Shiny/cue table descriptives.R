####Load the data####
dat = read.csv("Data/Affordance Norms_fsg.csv")
dat2 = read.csv("Data/Cue Table.csv")

##descriptives
#number of participants
mean(dat2$n)
sd(dat2$n)

min(dat2$n)
max(dat2$n)

#set sizes
mean(dat$AFSS)
sd(dat$AFSS)

min(dat$AFSS)
max(dat$AFSS)
