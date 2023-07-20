####Load the data####
dat = read.csv("Data/Affordance Norms_fsg.csv")
dat2 = read.csv("Data/Cue Table.csv")

##descriptives
#number of participants
mean(dat2$n)
sd(dat2$n)

min(dat2$n)
max(dat2$n)

##How many n less than 30?
low_n1 = subset(dat2,
                dat2$n < 30) #1944

##what about less than 25?
low_n2 = subset(dat2,
                dat2$n < 25) #1005

##less than 20?
low_n3 = subset(dat2,
               dat2$n < 20) #164

##less than 15?
low_n4= subset(dat2,
                dat2$n < 15) #15

#set sizes
mean(dat$AFSS)
sd(dat$AFSS)

min(dat$AFSS)
max(dat$AFSS)

####TO DO
##FIX CODING ON USM BATCH 1 AND 2 DATA
##COMPUTE NUMBER OF VERB ONLY RESPONSES
##GET NUMBERS UP -- SELECT ITEMS THAT NEED MORE RESPONSES AND PROGRAM UPDATED COLLECTORS
##FIGURE OUT WHICH ITEMS TO CUT!
##FIND A WAY TO TAG DIFFERENT TYPES OF AFFORDANCES?