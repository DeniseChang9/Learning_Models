#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Denise Chang
# Date: 30 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Download data ####
# Download data from Statistics Canada at https://www12.statcan.gc.ca/census-recensement/index-eng.cfm

#### Read data ####
census_2001 <- read_csv("inputs/data/data_from_source/2001_databaseLoadingData.csv")
census_2006 <- read_csv("inputs/data/data_from_source/2006_databaseLoadingData.csv")
census_2011 <- read_csv("inputs/data/data_from_source/2011_databaseLoadingData.csv")
census_2016 <-read_csv("inputs/data/data_from_source/2016_databaseLoadingData.csv")
census_2021 <- read_csv("inputs/data/data_from_source/2021_databaseLoadingData.csv")

#### Save data ####
write_parquet(census_2001, "inputs/data/raw_data/2001_census.parquet")
write_parquet(census_2006, "inputs/data/raw_data/2006_census.parquet")
write_parquet(census_2011, "inputs/data/raw_data/2011_census.parquet")
write_parquet(census_2016, "inputs/data/raw_data/2016_census.parquet")
write_parquet(census_2021, "inputs/data/raw_data/2021_census.parquet")

         
