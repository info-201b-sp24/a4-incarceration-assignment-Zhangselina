# Load necessary libraries
library(maps)
library(ggplot2)
library(tidyverse)

# clean_data <- data %>% drop_na(longitude, latitude, total_prison_pop)

# Get map data for the USA
data <- read_csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

usa <- map_data("state")

names <- data.frame(
  state = state.abb,
  name = state.name
)

names$name = tolower(names$name)


data <- data %>%
  right_join(names, by = "state") %>%
  select(state, total_prison_pop, name)

data <- data %>% group_by(name) %>%
  summarize(pop = sum(total_prison_pop, na.rm = T))

map_data <- usa %>%
  left_join(data, by = c("region" = "name"))



ggplot(data = map_data, aes(x = long, y = lat, group = group, fill = pop)) +
  geom_polygon(color = "white") +
  scale_fill_continuous(low = "lightgreen", high = "darkgreen", name = "Population") +
  labs(title = "Prison Population in the US by State") +
  theme_minimal() +
  theme(legend.position = "right",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

