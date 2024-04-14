#### Preamble ####
# Purpose: Tests clean test score data
# Author: Denise Chang
# Date: 31 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Test data ####
clean_data <- read_parquet("outputs/data/analysis_data.parquet")

# check that there are 2 possible subjects which are math and ela
length(unique(clean_data$subject)) == 2
all(clean_data$subject %in% c("math", "ela"))

# check that the data is within the studied range
min(clean_data$year) >= 2016
max(clean_data$year) <= 2021

# check that the schooling method shares are whole with error
schooling_shares <-
  na.omit(clean_data) |>
  select(share_inperson, share_virtual, share_hybrid)

all(rowSums(schooling_shares, na.rm = TRUE) <= 1.0005)
all(rowSums(schooling_shares, na.rm = TRUE) >= 0.9995)

# check that the demographic shares are whole with error
demographic_shares <- 
  na.omit(clean_data) |>
  select(share_black, share_white, share_hisp, share_other)

all(rowSums(demographic_shares, na.rm = TRUE) <= 1.0005)
all(rowSums(demographic_shares, na.rm = TRUE) >= 0.9995)

# check that all shares and rates are valid numbers
num_data <-
  na.omit(clean_data) |>
  select(-leaid, -subject, -year, -state_mailing)

all(num_data <= 1)
all(num_data >= 0)

