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
# EXAMPLE 
data <-
  tibble(
    level = rnorm(n = 500, mean = 50, sd = 4) |>
    floor(),
    weakness = sample(x = c('water', 'not water'), size = 500, replace = TRUE)
  )


