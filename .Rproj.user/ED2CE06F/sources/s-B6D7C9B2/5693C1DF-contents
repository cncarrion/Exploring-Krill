#This script loads krill data, cleans data set for summary statistics 
#and prepares data for data exploration

#load necessary libraries
library(tidyverse)

#Import and create a file “master_krill” that will have all krill data for all years
#Create subset datasets from master
#Use ID code to select species: will be useful for NMFS and less variation in dataset

#Location of files:
#Master_Krill -  https://docs.google.com/spreadsheets/d/1zqw2r9GwwRB4w68U57BlrukNEMaJ90QfZz8yvR9XeIY/edit#gid=0

#Importing Data

master_krill <- read.csv("Data/Master_Krill.csv")

# Summary statistics for Ep (total) at each Transect for all years
# Create data subset by species = Ep
Epacifica_all <- filter(master_krill, Species.Code == 1816)

# Create a new variable, log transformed CPUE
ep_all <- mutate(Epacifica_all, ln_catch = log(CPUE +1))

# Select necessary columns
ep_all_sum <- select(ep_all, Year, Transect:Sex, Species.Code, CPUE, ln_catch) %>%
  filter(Taxon == "Ep", Sex == "Both" | Sex == "both") %>%
  arrange(Year) %>%
  group_by(Year, Transect) %>%
  summarize(average_Ep = mean(CPUE), min_Ep = min(CPUE), max_Ep = max(CPUE), total_Ep = n())

# Plot average Ep at each transect 
ggplot (ep_all_sum, aes(x = Year, y = log(average_Ep))) +
  geom_point() + facet_wrap(vars(Transect))
                                