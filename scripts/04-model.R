#### Preamble ####
# Purpose: Models the pass rates, based on the learning models
# Author: Denise Chang
# Date: 15 April 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(arrow)
library(rstanarm)

#### Read data ####
analysis_data <- read_parquet("outputs/data/analysis_data.parquet")

agg_data <-
  analysis_data |>
  mutate(pass_rate = (pass3 + pass4 + pass5 + pass6 + pass7 + pass8) / 6) |>
  select(pass_rate, share_inperson, share_virtual, share_hybrid)

### Model data ####
first_model <-
  stan_glm(
    formula = pass_rate ~ share_inperson + share_virtual + share_hybrid,
    data = agg_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2),
    seed = 302
  )

# Summary of the model
summary(first_model)

#### Save model ####
saveRDS(
  first_model,
  file = "outputs/models/first_model.rds"
)
