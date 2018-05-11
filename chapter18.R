library(tidyverse)
library(modelr)
options(na.action = na.warn)

Se også her for løsninger: https://jrnold.github.io/r4ds-exercise-solutions/model-basics.html
# A simple model
## Exercise 1
```{r Ex 1.1}
# Simulate data
sim1a = tibble(
  x = rep(1:10, each = 3),
  y = x * 1.5 + 6 + rt(length(x), df = 2)
)
# Fit linear model
sim1_mod <- lm(y ~ x, data = sim1a)
coef(sim1_mod)
ggplot(sim1a, aes(x, y)) + 
  geom_point(size = 2, color = "grey30") +
  geom_abline(intercept = sim1_mod[["coefficients"]][["(Intercept)"]], slope = sim1_mod[["coefficients"]][["x"]])

# Man kan også "fitte" en lineær modell direkte i ggplot
ggplot(sim1a, aes(x, y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
```

Det er en del uteliggere i datasettet som ser ut til å ligge et stykke utenfor modellen. 

```{r Ex 1.2}
measure_distance <- function(mod, data){
  diff <- data$y - make_prediction(mod, data)
  mean(abs(diff))
}
# For the above function to work, we need to define a function make_prediction that takes a numeric vector of length two (the intercept and slope) and returns the predictions:
make_prediction <- function(mod, data){
  mod[1] + mod[2] * data$x
}

best <- optim(c(0, 0), measure_distance, data = sim1a)
best$par

ggplot(sim1a, aes(x, y)) +
  geom_point() +
  geom_abline(intercept = best$par[1], slope = best$par[2])
```
Linjen har ikke samme skjæringspunkt og stigningstall som sist. 

# Visualizing models
```{r}
grid <- sim1a %>% 
  data_grid(x)
grid <- grid %>% 
  add_predictions(sim1_mod)
ggplot(sim1a, aes(x)) +
  geom_point(aes(y = y)) +
  geom_line(
    aes(y = pred),
    data = grid,
    color = "red",
    size =1
  )
```

Denne linjen er den samme som den lineære modellen. Mens modellen bare setter skjæringspunkt og stigningstall, så er add_predictions regner ut hva tallene faktisk blir uti fra modellen (tallene varierer og er i x-kolonnen i datene. I dette tilfellet grid-dataene.)

```{r}
sim1a <- sim1a %>% 
  add_residuals(sim1_mod)
ggplot(sim1a, aes(resid)) +
  geom_freqpoly(binwidth = 0.5)
ggplot(sim1a, aes(x, resid)) +
  geom_ref_line(h = 0) +
  geom_point()
```
## Exercise 2
```{r Ex 2.1}
ggplot(sim1a, aes(x, y)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE)
```

