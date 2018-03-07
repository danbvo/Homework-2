#title: Homework 2, Stat-133
#description: this file contains codelines that reassemble the data set
#author: Daniel Vo
#input(s): "andre-iguodala.csv", "draymond-green.csv", "kevin-durant.csv", "klay-thompson.csv", "stephen-curry.csv"
#output(s): "shots-data.csv"

library("dplyr")
setwd("/Users/danbvo/Desktop/Academic-Portfolio/Stat-133/HW/hw02/data")
and <- read.csv(file = "andre-iguodala.csv", stringsAsFactors = FALSE)
dra <- read.csv(file = "draymond-green.csv", stringsAsFactors = FALSE)
kev <- read.csv(file = "kevin-durant.csv", stringsAsFactors = FALSE)
kla <- read.csv(file = "klay-thompson.csv", stringsAsFactors = FALSE)
ste <- read.csv(file = "stephen-curry.csv", stringsAsFactors = FALSE)

and$name <- c(rep("Andre Iguodala", 371))
dra$name <- c(rep("Draymond Green", 578))
kev$name <- c(rep("Kevin Durant", 915))
kla$name <- c(rep("Klay Thompson", 1220))
ste$name <- c(rep("Stephen Curry", 1250))

mutate(and, name = as.character(list(c(rep("Angre Iguodala", 371))))
and$shot_made_flag[and$shot_made_flag=="n"] <- "missed shot"
and$shot_made_flag[and$shot_made_flag=="y"] <- "made shot"

dra$shot_made_flag[dra$shot_made_flag=="n"] <- "missed shot"
dra$shot_made_flag[dra$shot_made_flag=="y"] <- "made shot"

kev$shot_made_flag[kev$shot_made_flag=="n"] <- "missed shot"
kev$shot_made_flag[kev$shot_made_flag=="y"] <- "made shot"

kla$shot_made_flag[kla$shot_made_flag=="n"] <- "missed shot"
kla$shot_made_flag[kla$shot_made_flag=="y"] <- "made shot"

ste$shot_made_flag[ste$shot_made_flag=="n"] <- "missed shot"
ste$shot_made_flag[ste$shot_made_flag=="y"] <- "made shot"

and$minute <- and$period*12-and$minutes_remaining
dra$minute <- dra$period*12-dra$minutes_remaining
kev$minute <- kev$period*12-kev$minutes_remaining
kla$minute <- kla$period*12-kla$minutes_remaining
ste$minute <- ste$period*12-ste$minutes_remaining

setwd("/Users/danbvo/Desktop/Academic-Portfolio/Stat-133/HW/hw02/output")
sink(file = "andre-iguodala-summary.txt")
summary(and)
sink()
sink(file = "draymond-green-summary.txt")
summary(dra)
sink()
sink(file = "kevin-durant-summary.txt")
summary(kev)
sink()
sink(file = "klay-thompson-summary.txt")
summary(kla)
sink()
sink(file = "stephen-curry-summary.txt")
summary(ste)
sink()

dt <- rbind(and, kev, kla, ste, dra)
setwd("/Users/danbvo/Desktop/Academic-Portfolio/Stat-133/HW/hw02/data")
write.csv(file = "shots-data.csv", dt)

setwd("/Users/danbvo/Desktop/Academic-Portfolio/Stat-133/HW/hw02/output")
sink(file = "shots-data-summary.txt")
summary(dt)
sink()

















