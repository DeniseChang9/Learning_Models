#### Preamble ####
# Purpose: Cleans the raw data of the US test scores pre and post pandemic schooling
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

# choose the relevant columns
clean_school_data <-
  school_data |>
  select(leaid, subject, year,
         pass3, pass4, pass5, pass6, pass6, pass7, pass8, 
         share_inperson, share_virtual, share_hybrid)

# make both values the same data type
district_data <- 
  district_data |>
  mutate(leaid = as.numeric(leaid))

clean_school_data <-
  clean_school_data |>
  mutate(leaid = as.numeric(leaid))

# include the state of each institution
clean_district_data <-
  district_data |>
  select(leaid, state_mailing)

cleaner_school_data <- 
  clean_school_data |>
  left_join(clean_district_data, by = "leaid")

#### Save data ####
write_parquet(cleaner_school_data, "outputs/data/analysis_data.parquet")
