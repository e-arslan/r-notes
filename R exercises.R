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

library(purrr)
lst <- list(
  x = c("january", "february"), 
  y = c("september", "october")
)
map(lst, toupper)


##############

library(purrr)
costs <- list(
  c(item_a = 28, item_b = -35),
  c(item_a = "-30", item_b = "37")
)
absolute_value <- safely(abs)
map(costs, absolute_value)




##############

sales <- list(
  apr = c(6, 10, 4), 
  may = c(15, 17, 11)
)
x <- vector("double", 2)
for (i in seq_along(sales)) {
  x[i] <- mean(sales[[i]])
}
x



####################

x <- "9_June_2000"
as.Date(x, format = "%d_%B_%Y")



####################

x <- c("2010-01-15 09:15:25", "2010-01-15 10:21:10", "2010-01-15 11:00:52")
diff(as.POSIXct(x))



####################

library(purrr)
x1 <- c(11, 30, 4, 21)
# Find the sum, mean, sd, and median of the vector x1
f <- list("sum", "mean", "sd", "median")
invoke_map(f, x = x1)



####################

