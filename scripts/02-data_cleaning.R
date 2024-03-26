#### Preamble ####
# Purpose: Cleans the raw data
# Author: Denise Chang
# Date: 26 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(-timestamp) |>
  rename(c(certainty = how_certain_about_your_guess_are_you, 
           outcome = what_was_the_outcome)) |>
  mutate(
      outcome = if_else(outcome == "Guesse right",
                        1,
                        0))
 

#### Save data ####
write_parquet(cleaned_data, "outputs/data/analysis_data.parquet")
