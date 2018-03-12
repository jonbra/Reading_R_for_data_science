library(tidyverse)

stocks <- tibble(
  year = c(2015, 2015, 2016, 2016),
  half = c(   1,    2,    1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks

stocks %>% 
  spread(year, return) %>% 
  gather("year", "return", `2015`:`2016`)
?spread

people <- tribble(
  ~name, ~key, ~value, ~name2,
  "PW", "age", 45, "mike",
  "PW", "height", 186, "mike",
  "PW", "age", 72, "john"
)
people
people %>% 
  spread(key, value)
