#### Preamble ####
# Purpose: Cleans the raw data of the 2001, 2006, 2011, 2016 and 2021 Canadian Language census
# Author: Denise Chang
# Date: 30 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(arrow)

#### Clean data ####
school_data <- read_parquet("inputs/data/raw_data/raw_school_data.parquet")
district_data <- read_parquet("inputs/data/raw_data/raw_district_data.parquet")

#### Save data ####
# write_parquet(all_census_tibble, "outputs/data/clean_census_data.parquet")
