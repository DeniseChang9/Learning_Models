#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Denise Chang
# Date: 28 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(httr)
library(xml2)

#### Download data ####
genshin_char <- GET("https://genshinlist.com/api/characters")
genshin_weapons <- GET("https://genshinlist.com/api/weapons")
genshin_artifacts <- GET("https://genshinlist.com/api/artifacts")

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
# write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
