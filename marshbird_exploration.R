#load packages
pacman::p_load('tidyverse', 'janitor', 'here')

# Read point count
marshbird <- read_csv(here::here('data','secretive_marshbird.csv'))

unique(marshbird$CommonName)

exp_marsh <- marshbird %>%
  clean_names() %>%
  drop_na(common_name)

exp_marsh_plot <- exp_marsh %>%
  group_by(study_area, common_name) %>%
  summarise(n = sum(observation_count)) %>%
  arrange(study_area, desc(n))

