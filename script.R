library(leaflet)
library(zoo)
library(shiny)
library(dplyr)

myDF = read.csv("Walking.csv")
gtFrame = myDF[,c(1,2,3)]
phoneFrame = myDF[,c(1,4,5)]

gtZoo = zoo(gtFrame)
phoneZoo = zoo(phoneFrame)

phoneZoo = rollmean(phoneZoo,27)

m = leaflet() %>%
  addTiles() %>%
  addPolylines(data = data.frame(gtZoo),lat = ~gt_lat,lng = ~gt_long,color = "cyan") %>%
  addPolylines(data = data.frame(phoneZoo),lat = ~phone_lat,lng = ~phone_long,color = "red")
m

