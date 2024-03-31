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

#### Clean data for 2001 census ####
census_2001 <- read_parquet("inputs/data/raw_data/2001_census.parquet")

# Remove demographic information
clean_names(census_2001)

census_2001 <-
  census_2001 |>
  slice(3:4)

head(census_2001)

#### Save data ####
# write_parquet(cleaned_data, "outputs/data/analysis_data.parquet")
