library(purrr)

# Exercises
## 1.a
# Can also use names(output) <- names(mtcars) to get names on the output
output <- vector("double", length = length(mtcars)) # or ncol(mtcars)
for (i in seq_along(mtcars)) {
  output[[i]] <- median(mtcars[[i]])
}
output

## 1.b
library(nycflights13)
output <- vector("list", length = length(flights))
for (i in seq_along(flights)) {
  output[[i]] <- class(flights[[i]])
}
output

## 1.c
output <- vector("integer", length = length(iris))
for (i in seq_along(iris)) {
  output[[i]] <- length(unique(iris[[i]]))
}
output

## 1.d
# mu is the mean, -10, 0, 10, 100
# number to draw
n <- 10 # I guess one can also just write the number inside the for loop
# values of the mean
mu <- c(-10, 0, 10, 100)
normals <- vector("list", length(mu))
for (i in seq_along(normals)) {
  normals[[i]] <- rnorm(n, mean = mu[i])
}
normals

## 2
out <- ""
for (x in letters) {
  out <- stringr::str_c(out, x)
}

#alternatives
glue::collapse(letters, sep = "")
stringr::str_c(letters, collapse = "")

#--------------------

x <- sample(100)
sd <- 0
for (i in seq_along(x)) {
  sd <- sd + (x[i] - mean(x)) ^ 2
}
sd <- sqrt(sd / (length(x) - 1))

#alternative
sd(x)

#--------------------

x <- runif(100)
out <- vector("numeric", length(x))
out[1] <- x[1]
for (i in 2:length(x)) {
  out[i] <- out[i - 1] + x[i]
}

# alternative
cumsum(x)
all.equal(cumsum(x),out) #calculate cumulative sum with cumsum
#> [1] TRUE

## 3
humps <- c("five", "four", "three", "two", "one", "no")
for (i in humps) {
  # the rep function just repeats the word three times. And because of recyling, str_c will concatenate three identical strings. collapse = "\n" will put \n between the three strings. This will be printed as newline by cat
  cat(stringr::str_c("Alice the camel has ", rep(i, 3), " humps.",
            collapse = "\n"), "\n")
  if (i == "no") {
    cat("Now Alice is a horse.\n")
  } else {
    cat("So go, Alice, go.\n")
  }
  cat("\n")
}

#-----------------

x <- 10
sleeping <- "bed"
my_func <- function(number = x, sleeping = y) {
  for (i in rev(seq_along(i:x))) {
    cat(stringr::str_c("There were ", i, " in the bed\n"))
  }
}
  
my_func(number = 10, sleeping = "bed")  

x <- c("ten", "nine", "eight")
for (i in x) {
  cat(stringr::str_c("There were ", i, " in the bed\n"))
  cat("and the little one said\n")
  if (i == "one") {
    cat("I'm lonely...")
  } else {
    cat("Roll over, roll over\n")
    cat("So they all rolled over and one fell out.\n")
  }
  cat("\n")
}
