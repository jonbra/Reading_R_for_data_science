library(tidyverse)

ggplot(data=diamonds) +
  geom_bar(mapping = aes(x=cut))
?geom_bar
?stat_summary

ggplot(diamonds)+
  geom_pointrange(mapping=aes(x=cut, y=depth),
                  fun.ymin=min,
                  fun.ymax=max,
                  fun.y=median
                )

?geom_pointrange
