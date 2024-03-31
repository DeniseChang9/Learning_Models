#### Preamble ####
# Purpose: Tests clean census data
# Author: Denise Chang
# Date: 31 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Test data ####

# read and select data
clean_census_data <- read_parquet("outputs/data/clean_census_data.parquet")
census_2001 <- filter(clean_census_data, year == 2001)
census_2006 <- filter(clean_census_data, year == 2006)
census_2011 <- filter(clean_census_data, year == 2011)
census_2016 <- filter(clean_census_data, year == 2016)
census_2021 <- filter(clean_census_data, year == 2021)

# check that the sum of respondents matches the total respondents in 2001, 2006, 2011, 2016 and 2021
census_2001$total_knowledge_of_official_languages <= census_2001$english_only + census_2001$french_only + census_2001$english_and_french + census_2001$neither_english_nor_french
census_2006$total_knowledge_of_official_languages == census_2006$english_only + census_2006$french_only + census_2006$english_and_french + census_2006$neither_english_nor_french
census_2011$total_knowledge_of_official_languages == census_2011$english_only + census_2011$french_only + census_2011$english_and_french + census_2011$neither_english_nor_french
census_2016$total_knowledge_of_official_languages >= census_2016$english_only + census_2016$french_only + census_2016$english_and_french + census_2016$neither_english_nor_french
census_2021$total_knowledge_of_official_languages <= census_2021$english_only + census_2021$french_only + census_2021$english_and_french + census_2021$neither_english_nor_french

# check that the number of respondents are positive numbers
only_respondents <-
  clean_census_data |>
  select(total_knowledge_of_official_languages, english_only, french_only, english_and_french, neither_english_nor_french)

all(only_respondents >= 0)

# check that every value in 'year' is unique
num_values <-
  clean_census_data$year |>
  unique() |>
  length()

nrow(clean_census_data) == num_values
