#### Preamble ####
# Purpose: Simulates an analysis dataset about Pokemon level and weakness against water
# Author: Denise Chang
# Date: 26 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(42)

# Simulate 500 districts
num_districts <- 500
district_ids <- seq(1, num_districts)

# Generate data
data <- data.frame(
  district_id = district_ids,                                 
  year = sample(2017:2021, num_districts, replace = TRUE),    
  in_person_share = runif(num_districts, min = 0, max = 1), 
  virtual_share = runif(num_districts, min = 0, max = 1),     
  hybrid_share = runif(num_districts, min = 0, max = 1),
  subject = sample(c("ela", "math"), num_districts, replace = TRUE)
)

# Normalize shares so they sum up to 1 in each row
data[, c("in_person_share", "virtual_share", "hybrid_share")] <- 
  data[, c("in_person_share", "virtual_share", "hybrid_share")] / rowSums(data[, c("in_person_share", "virtual_share", "hybrid_share")])



