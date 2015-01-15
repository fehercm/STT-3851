# Zener Card Simulation
# Last Updated 01/14/2015 @ 5:00pm JET

zcards <- c("circle","circle","circle","circle","circle",
            "cross","cross","cross","cross","cross",
            "waves","waves","waves","waves","waves",
            "square","square","square","square","square",
            "star","star","star","star","star")

zcards2 <- c("circle","cross","waves","square","star")

#fulty deck #

zcards3 <- c("circle","circle","circle","circle","circle",
             "cross","cross","cross","cross","cross",
             "waves","waves","waves","waves","waves",
             "star","square","square","square","square",
             "star","star","star","star","star")

sample(zcards3,25)


sample(zcards2,25,T)

#prob changes#
probs <- c(    .20,    .20,     .20,    .16,    .24)

table(sample(zcards2,100000,T, probs))


prop.table(table(sample(zcards2,100000,T, probs)))
?sample

#back to deck#

