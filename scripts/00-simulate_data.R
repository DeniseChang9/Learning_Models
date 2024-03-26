#### Preamble ####
# Purpose: Simulates the data on pokemon (to be updated)
# Author: Denise Chang
# Date: 26 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
# EXAMPLE 
data <-
  tibble(
    level = rnorm(n = 1000, mean = 100, sd = 10) |>
    floor(),
    weakness = sample(x = c('fire', 'not fire'), size = 1000, replace = TRUE)
  )


