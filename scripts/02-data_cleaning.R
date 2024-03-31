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

census_2001 <-
  clean_names(census_2001) |>
  slice(1) |>
  select(total_knowledge_of_official_languages, 
         english_only, french_only, 
         english_and_french, 
         neither_english_nor_french)


#### Clean data for 2006 census ####
census_2006 <- read_parquet("inputs/data/raw_data/2006_census.parquet")

census_2006 <-
  clean_names(census_2006) |>
  select(knowledge_of_official_languages_5, 
         total_number_of_non_official_languages_known)

# pivot the tibble to match the other censuses
census_2006$knowledge_of_official_languages_5 <- 1:5
 
census_2006 <- pivot_wider(census_2006,
                           names_from = knowledge_of_official_languages_5,
                           values_from = total_number_of_non_official_languages_known)
colnames(census_2006) <- c("total_knowledge_of_official_languages", 
                           "english_only", "french_only", 
                           "english_and_french", 
                           "neither_english_nor_french")

#### Clean data for 2011 census ####


#### Clean data for 2016 census ####


#### Clean data for 2021 census ####


#### Save data ####
# write_parquet(cleaned_data, "outputs/data/analysis_data.parquet")
