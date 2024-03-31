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

# pivot the tibble
census_2006$knowledge_of_official_languages_5 <- 1:5
 
census_2006 <- pivot_wider(census_2006,
                           names_from = knowledge_of_official_languages_5,
                           values_from = total_number_of_non_official_languages_known)

colnames(census_2006) <- c("total_knowledge_of_official_languages", 
                           "english_only", 
                           "french_only", 
                           "english_and_french", 
                           "neither_english_nor_french")


#### Clean data for 2011 census ####
census_2011 <- read_parquet("inputs/data/raw_data/2011_census.parquet")

census_2011 <-
  clean_names(census_2011) |>
  filter(geo == "Quebec") |>
  select(knowledge_of_official_languages_5, value)

# pivot the tibble
census_2011$knowledge_of_official_languages_5 <- 1:5

census_2011 <- pivot_wider(census_2011,
                           names_from = knowledge_of_official_languages_5,
                           values_from = value)

colnames(census_2011) <- c("total_knowledge_of_official_languages", 
                           "english_only", 
                           "french_only", 
                           "english_and_french", 
                           "neither_english_nor_french")


#### Clean data for 2016 census ####
census_2016 <- read_parquet("inputs/data/raw_data/2016_census.parquet")

census_2016 <-
  clean_names(census_2016) |>
  filter(geo == "Quebec") |>
  select(knowledge_of_official_languages_5, value)

# pivot the tibble
census_2016$knowledge_of_official_languages_5 <- 1:5

census_2016 <- pivot_wider(census_2016,
                           names_from = knowledge_of_official_languages_5,
                           values_from = value)

colnames(census_2016) <- c("total_knowledge_of_official_languages", 
                           "english_only", 
                           "french_only", 
                           "english_and_french", 
                           "neither_english_nor_french")


#### Clean data for 2021 census ####
census_2021 <- read_parquet("inputs/data/raw_data/2021_census.parquet")

census_2021 <-
  clean_names(census_2021) |>
  filter(geo == "Quebec") |>
  select(knowledge_of_official_languages_5, value)

# pivot the tibble
census_2021$knowledge_of_official_languages_5 <- 1:5

census_2021 <- pivot_wider(census_2021,
                           names_from = knowledge_of_official_languages_5,
                           values_from = value)

colnames(census_2021) <- c("total_knowledge_of_official_languages", 
                           "english_only", 
                           "french_only", 
                           "english_and_french", 
                           "neither_english_nor_french")


#### Combine census data ####
all_census_data <- bind_rows(census_2001, 
                             census_2006, 
                             census_2011, 
                             census_2016, 
                             census_2021)

year_tibble = tibble(year = c("2001", "2006", "2011", "2016", "2021"))
all_census_tibble <- bind_cols(year_tibble, all_census_data)
all_census_tibble


#### Save data ####
write_parquet(all_census_tibble, "outputs/data/clean_census_data.parquet")
