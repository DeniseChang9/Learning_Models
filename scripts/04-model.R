#### Preamble ####
# Purpose: Models whether we guessed right, based on our confidence
# Author: Denise Chang
# Date: 31 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02_download_data.R

#### Workspace setup ####
library(tidyverse)
library(arrow)
library(rstanarm)

#### Read data ####
analysis_data <- read_parquet("outputs/data/clean_census_data.parquet")

analysis_data |>
  ggplot(aes(x = certainty, y = outcome)) +
  geom_jitter(height = 0)


### Model data ####
first_model <-
  stan_glm(
    formula = outcome ~ certainty,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

summary(first_model)

#### Save model ####
saveRDS(
  first_model,
  file = "outputs/models/first_model.rds"
)
