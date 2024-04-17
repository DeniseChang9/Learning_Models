#### Preamble ####
# Purpose: Downloads and saves the data from OPENICPSR
# Author: Denise Chang
# Date: 30 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(haven)
library(arrow)

#### Download data ####
# Download data from OPENICPSR at http://doi.org/10.3886/E168843V1

#### Read data ####
school_data <- read_dta("inputs/data/data_from_source/state_score_data.dta")
leaid_data <- read_dta("inputs/data/data_from_source/nces_district_directory_2018.dta")

#### Save data ####
write_parquet(school_data, "inputs/data/raw_data/raw_school_data.parquet")
write_parquet(leaid_data, "inputs/data/raw_data/raw_district_data.parquet")
