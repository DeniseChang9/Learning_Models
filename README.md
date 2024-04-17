# An analysis of Pokemon data

## Overview
This repository contains the data, scripts and paper used in the reproduction of Halloran, Jack, Okun and Oster's "Pandemic Schooling Mode and Student Test Scores: Evidence from U.S. School Districts" (2021). This analysis furthers the original paper's discussion on the different learning models adopted during the COVID-19 pandemic and their influence on student learning. The paper concludes that students' pass rates on state-standardized assessments significantly decreased from Spring 2019 to Spring 2021, with a larger fall in pass rates in districts with higher virtual learning shares and lower in-person learning shares.

Link to the original paper: http://www.nber.org/papers/w29497 
Link to the replication package: https://doi.org/10.3886/E168843V1

## File Structure

The repo is structured as:

-   `inputs/data/data_from_source` contains the raw data as obtained from the replication package.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `model` contains the fitted model. 
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. This section also includes the Quarto document and PDF of the datasheet for this paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage
The following LLM were consulted for this paper:
-   `Grammarly` was used to proofread the text for any vocabulary or grammar issues. 
-   `Google Translate` was used to translate specific words from French to English and to be included in the paper.