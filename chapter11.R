library(tidyverse)

(x <- "\u00b5")
x

str_c("x", "y")
str_c("x", "y", sep = ", ")

x <- c("abc", NA)
x
str_c("|-", x, "-|")
str_c("|-", str_replace_na(x), "-|")

x <- c("apple", "banana", "pear")
str_view(x, "an")       
str_view(x, ".a.")

x <- "1888 is the longest... MDCCCLXXXVIII"
str_view(x, "CC?")
str_view(x, "CC+")
str_view(x, "C[LX]+")
str_view(x, "C[LX]")
str_view(x, "C[LX]?")
