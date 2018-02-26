library(tidyverse)
#install.packages("nycflights13")
library(nycflights13)
?flights
flights

?filter()

filter(flights, month == 1, day == 1)

View(flights)

# Exercises
flights %>% 
  filter(arr_delay > 120) %>% View

flights %>% 
  filter(dest == "IAH" | dest == "HOU") %>% View

flights %>% 
  filter(carrier %in% c("UA", "DL")) %>% View

flights %>% 
  filter(month == 7 | month == 8 | month == 9)

flights %>% 
  filter(month %in% c(7, 8, 9))

flights %>% 
  filter(arr_delay > 120 & dep_delay <= 0)

flights %>% 
  select(arr_delay, arr_time, sched_arr_time, everything()) %>% 
  filter(arr_delay >= 60)

?between

x <- c(1:10)
x[between(x, 4, 8)]

flights %>% 
  filter(is.na(dep_time))

flights %>% 
  select(dep_time) %>% 
  arrange(desc(is.na(dep_time)))

flights %>% 
  select(arr_delay, everything()) %>% 
  arrange(desc(arr_delay))
    
flights %>% 
  select(dep_delay, everything()) %>% 
  arrange(dep_delay)

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(tailnum) %>% 
  summarize(delay = mean(arr_delay)) %>% 
  ggplot(mapping = aes(x=delay)) +
  geom_freqpoly(binwidth = 10)

not_cancelled %>% 
  group_by(tailnum) %>% 
  summarize(
    delay = mean(arr_delay, na.rm = TRUE), 
    n = n()) %>% 
  ggplot(mapping = aes(x=n, y=delay)) +
  geom_point(alpha=1/10)
