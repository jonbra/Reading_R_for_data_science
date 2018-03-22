library(tidyverse)
library(forcats)

ggplot(gss_cat, aes(race)) +
  geom_bar()

# show empty levels
ggplot(gss_cat, aes(race)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)

gss_cat

ggplot(gss_cat, aes(rincome)) +
  geom_bar()

gss_cat %>% 
  filter(rincome != "Not applicable", 
         rincome != "No answer", 
         rincome != "Refused", 
         rincome != "Don't know") %>% 
  ggplot(aes(rincome)) +
  geom_bar()

gss_cat %>% 
  count(relig) %>% 
  arrange(desc(n))

gss_cat %>% 
  count(partyid) %>% 
  arrange(desc(n))

gss_cat %>% 
  group_by(relig, denom) %>% 
  summarise()

# Count and plot average tvhours
relig <- gss_cat %>% 
  group_by(relig) %>% 
  summarize(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n())

ggplot(relig, aes(tvhours, relig)) + geom_point()
  
# Reorder the factor relig by average tvhours
ggplot(relig, aes(tvhours, fct_reorder(relig, tvhours))) +
  geom_point()

# one can also reorder using mutate
relig %>% 
  mutate(relig = fct_reorder(relig, tvhours)) %>% 
  ggplot(aes(tvhours, relig)) + 
  geom_point()

gss_cat %>% 
  group_by(rincome) %>% 
  summarize(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  ) %>% 
  ggplot(aes(age, fct_reorder(rincome, age))) +
  geom_point()
