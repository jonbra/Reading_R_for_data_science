library(tidyverse)
typeof(letters)
typeof(1:10)

w <- list("a", "b", 1:10)
w
length(w)
?"%%"

typeof(1)
typeof(1L)

x <- sqrt(2) ^ 2
x-2

x <- "This is a reasonably long string"
pryr::object_size(x)

y <- rep(x, 1000)
pryr::object_size(y)

dplyr::near

x <- sample(20, 100, replace = TRUE)
x

y <- x > 10
y
sum(y)
mean(y)
