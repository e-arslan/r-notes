############
x <- 2

add <- function() {
  x + 1
}

x1 <- add()
x2 <- add()

c(x1, x2)

#############

library(purrr)
avg_temp <- data.frame(
  year =  c(2015, 2015, 2014, 2014),
  month = c("Jan", "Feb", "Jan", "Feb"), 
  temp =  c(32, 24, 30, 23)
)

avg_temp %>%
split(.$year) %>%
  map("temp")



#############
library(purrr)
lst <- list(
  x = c(6.8, 3.1, 7.9, NA), 
  y = c(15.4, 6, 13.9, NA)
)

sapply(lst, sum, na.rm = T)


##############
library(purrr)
new_sqrt <- safely(sqrt)
new_sqrt(c(16, 4, 25, 9))



##############




##############






##############





###############


