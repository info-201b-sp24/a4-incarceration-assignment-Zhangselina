# Load necessary libraries
library(ggplot2)
library(scales)

# Load the dataset
url <- "https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv"
data <- read.csv(url)

# Filter the dataset for a specific state (e.g., CO) to showcase the trend over time
state_data <- subset(data, state == "CO")

# Remove rows with missing values
state_data <- na.omit(state_data)

# Create the scatter plot with a regression line to show the relationship between total population and total prison population
ggplot(state_data, aes(x = total_pop, y = total_prison_pop)) +
  geom_point(color = "blue", size = 3, alpha = 0.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  scale_x_continuous(labels = comma) +
  labs(
    title = "Relationship between Total Population and Total Prison Population in Colorado",
    x = "Total Population",
    y = "Total Prison Population"
  ) +
  theme_minimal(base_size = 15) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
