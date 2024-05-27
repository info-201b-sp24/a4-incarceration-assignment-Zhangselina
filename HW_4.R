library(dplyr)
library(ggplot2)
library(readr)
library(maps)
library(tidyr)

# Load the dataset
data <- read_csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Inspect the data


# Calculate summary statistics
average_prison_pop <- data %>% summarise(avg_prison_pop = mean(total_prison_pop, na.rm = TRUE)) %>% pull()
highest_prison_pop <- data %>% filter(total_prison_pop == max(total_prison_pop, na.rm = TRUE)) %>% select(total_prison_pop) %>% pull()
lowest_prison_pop <- data %>% summarize(min = min(total_prison_pop, na.rm = TRUE)) %>% select(min) %>% pull()
median_prison_pop <- data %>% summarize(median_prison_pop = median(total_prison_pop, na.rm = TRUE)) %>% pull()
std_dev_prison_pop <- data %>% summarize(sd_prison_pop = sd(total_prison_pop, na.rm = TRUE)) %>% pull()


## Data Description



