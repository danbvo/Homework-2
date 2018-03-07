#title: Homework 2, Stat-133
#description: this file contains codelines create charts
#author: Daniel Vo
#input(s): 
#output(s): 

library(ggplot2)
library(dplyr)
library(jpeg)

dt <- read.csv(file = "/Users/danbvo/Desktop/Academic-Portfolio/Stat-133/HW/hw02/data/shots-data.csv")
kla <- filter(dt, name=="Klay Thompson")
kla_scatterplot <- ggplot(data = kla) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

ct_file <- "../images/nba-court.jpg"
ct_image <- rasterGrob(
  readJPEG(ct_file), 
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

kla_shot_chart <- ggplot(data = kla) +
  annotation_custom(ct_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
kla_shot_chart

and <- filter(dt, name=="Andre Iguodala")
and_shot_chart <- ggplot(data = and) +
  annotation_custom(ct_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle("Shot Chart: Andre Iguodala 2016 Season") + 
  theme_minimal()
and_shot_chart

kev <- filter(dt, name=="Kevin Durant")
kev_shot_chart <- ggplot(data = kev) +
  annotation_custom(ct_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle("Shot Chart: Kevin Durant 2016 Season") + 
  theme_minimal()
kev_shot_chart

dra <- filter(dt, name=="Draymond Green")
dra_shot_chart <- ggplot(data = dra) +
  annotation_custom(ct_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle("Shot Chart: Draymond Green 2016 Season") + 
  theme_minimal()
dra_shot_chart

ste <- filter(dt, name=="Stephen Curry")
ste_shot_chart <- ggplot(data = dra) +
  annotation_custom(ct_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle("Shot Chart: Stephen Curry 2016 Season") + 
  theme_minimal()
ste_shot_chart

pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 8, height = 7)
and_shot_chart
dev.off()
pdf(file = "../images/draymond-green-shot-chart.pdf", width = 8, height = 7)
dra_shot_chart
dev.off()
pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 8, height = 7)
kev_shot_chart
dev.off()
pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 8, height = 7)
kla_shot_chart
dev.off()
pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 8, height = 7)
ste_shot_chart
dev.off()

aggregate <- ggplot(data = dt, aes(x = x, y = y, color = shot_made_flag)) + 
  annotation_custom(ct_image, -250, 250, -50, 420) +
  geom_point() +
  ylim(-50, 420) +
  ggtitle("Shot Chart: comparision among the NBA Players 2016 Season") +
  theme_minimal() +
  facet_wrap(~ name)
aggregate

pdf(file = "../images/gsw-shot-charts.pdf", width = 7, height = 8)
aggregate
dev.off()



















