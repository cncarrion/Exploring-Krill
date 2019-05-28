#Erdapp Data to Join to Krill Data

#load tidyverse
library(tidyverse)

# Downloaded CTD data from 2003 to 2015
# .csv file has all CTD casts. Location: Data/FED_Rockfish_CTD_2003_2015.csv

# Clean data set:
# Remove daytime casts, stations > 1000, and join CTD file to match krill stations

nmfs_ctd <- read.csv("Data/FED_Rockfish_CTD_2003_2015.csv", skip = 2,
                     col.names = c('time','latitude','longitude','cruise','ctd_index','ctd_depth',
                                   'temperature','salinity','density','dyn_hgt','irradiance',
                                   'fluor_volt','transmissivity','chlorophyll','oxygen_volt',
                                   'oxygen','ctd_number','station','bottom_depth','vessel')) #line 1: names, line 2:units
head(nmfs_ctd)
                     
nmfs_ctd_night <- filter(nmfs_ctd, station < 1000)

head(nmfs_ctd_night)