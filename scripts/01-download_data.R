#### Preamble ####
# Purpose: Downloads and saves the data from OPENICPSR
# Author: Denise Chang
# Date: 30 March 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(haven)
library(arrow)

#### Download data ####
# Download data from OPENICPSR at http://doi.org/10.3886/E159261V1 

#### Read data ####
raw_data <- read_dta("inputs/data/main_dataset.dta")

#### Save data ####
write_parquet(raw_data, "inputs/data/raw_dataset.parquet")


         
