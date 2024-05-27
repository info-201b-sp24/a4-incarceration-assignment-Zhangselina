library(ggplot2)
library(scales)
library(dplyr)

url <- "https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv"
data <- read.csv(url)

states_to_compare <- c("CO", "CA", "TX", "NY", "FL")

state_data <- data %>%
  filter(state %in% states_to_compare & year >= 1970 & year <= 2018) %>%
  group_by(state, year) %>%
  summarise(total_prison_pop = sum(total_prison_pop, na.rm = TRUE)) %>%
  ungroup()

ggplot(state_data, aes(x = year, y = total_prison_pop, color = state)) +
  geom_point(size = 2, alpha = 0.7) +
  geom_line(size = 1) +
  scale_y_continuous(labels = comma, limits = c(0, max(state_data$total_prison_pop, na.rm = TRUE) * 1.1)) +
  scale_x_continuous(breaks = pretty_breaks(n = 10)) +
  labs(
    title = "Trend of Total Prison Population Over Time (1970-2018)",
    x = "Year",
    y = "Total Prison Population",
    color = "State"
  ) +
  theme_minimal(base_size = 15) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major = element_line(color = "grey", size = 0.5),
    panel.grid.minor = element_blank()
  )
