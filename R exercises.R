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



#################

# & and && indicate logical AND and | and || indicate logical OR. The shorter form performs
# elementwise comparisons in much the same way as arithmetic operators. The longer form evaluates
# left to right examining only the first element of each vector. Evaluation proceeds only until
# the result is determined. The longer form is appropriate for programming control-flow and 
# typically preferred in if clauses.

x <- c(FALSE, FALSE, FALSE)
y <- c(FALSE, TRUE, TRUE)
x && y 

x <- c(TRUE, FALSE, FALSE)
y <- c(TRUE, TRUE, TRUE)
x && y 

#################
avengers <- list(
  list("phil coulson", "nick fury"), 
  list("thor", "hulk")
)

map(avengers, 2)

map_chr(avengers, 2)



#################

##       apply(X,MARGIN, FUN, ...)
# X : Matrix
# MARGIN : 1-> rows,  2-> columns  
# FUN : 
# Output : vector

##      lapply
# The difference : 
#     - Dataframes, lists or vectors as input
#     - The output returned is a list

# Examples:

# Extract the 2nd column from `MyList` with the selection operator `[` with `lapply()`
#   lapply(MyList,"[", , 2)
# Extract the 1st row from `MyList`
#   lapply(MyList,"[", 1, )


##      sapply
# same as lapply returns vector instead of array
# sapply(MyList,"[", 2, 1, simplify=F) = lapply(MyList,"[", 2, 1 )
# sapply(MyList,"[", 2, 1, simplify=F) = unlist(lapply(MyList,"[", 2, 1 ))


##      vapply


#################

library(purrr)
costs <- list(
  c(item_a = 28, item_b = -35),
  c(item_a = "-24", item_b = "-28")
)
absolute_value <- safely(abs)
map(costs,absolute_value)




################

p <- list(1, 2:3)
list(p, list(c(3, 5)))
append(p, list(c(3, 5)))




################
library(purrr)
lst1 <- list(month = c("May", "Mar"), day = c("Wed", "Thu"))
lst2 <- list(month = c("Aug", "Nov"), day = c("Sat", "Fri"))
map2(lst1, lst2, ~ c(.x, .y))



###############

safe_mean <- function(x) {
  type <- class(x)
  stopifnot(type != "character")
  mean(x, na.rm = TRUE)
}

safe_mean(c("1", "2", "3"))

###############

library(purrr)
x1 <- c(13, 22, 19, 14)
# Find the sum, mean, and median of the vector x1
f <- list("sum", "mean", "sd", "median")
invoke_map(f, x = x1)


###############

library(purrr)
year  <- list(x = c(2010, 2012), y = c(2016, 2014))
month <- list(x = c(1, 5), y = c(7, 4))
day   <- list(x = c(12, 25), y = c(27, 21))
pmap(list(year, month, day), paste, sep = "-")


###############

library(purrr)
lst <- list(
  x = c(10, 5, 4), 
  y = c(15, 16, 19)
)
map_dbl(lst, min)


###############

p <- as.Date("2014-03-21")
format(p, "%B-%d")



###############

lst <- list(p = c(18, 11), q = c("Dec", "Nov"))
vapply(lst, is.logical, logical(1))



###############

(function(x, y) { x * y })(2, 3)



###############

library(purrr)
fruits <- list(
  list(name = c("banana", "avacado"), stock = c(20, 10)), 
  list(name = c("nut", "olive"), stock = c(90, 80))
)
fruits %>%
  map("name") %>%
  map_chr(1)



###############

library(purrr)
costs <- list(
  c(item_a = -25, item_b = 30),
  c(item_a = "-24", item_b = "30")
)
absolute_value <- safely(abs)
map(costs, absolute_value)




###############

library(purrr)
x1 <- c(10, 22, 20, 14)
# Find the sum, mean, and median of the vector x1
f <- list("sum", "mean", "sd", "median")
invoke_map(f, x = x1)



###############

products <- data.frame(
  item = c("A", "B", "B", "A", "B"), 
  cost = c(50, 46, 28, 38, 20), 
  profit = c(15, 5, 10, 12, 5), 
  sold_out = c(FALSE, TRUE, FALSE, FALSE, TRUE)
)
subset(products, item == "B")



###############

library(purrr)
avg_temp <- data.frame(
  year =  c(2016, 2016, 2015, 2015),
  month = c("Jan", "Feb", "Jan", "Feb"), 
  temp =  c(26, 30, 25, 28)
)
avg_temp %>%
  split(.$year) %>%
  map("temp")




###############

library(purrr)
df <- data.frame(
  x = c(20, 10), 
  y = c("olives", "nuts")
)
map_lgl(df, is.logical)




###############

library(purrr)
new_sqrt <- safely(sqrt)
new_sqrt(c("16", "12", "4", "20"))



###############

library(purrr)
lst1 <- list(month = c("May", "Mar"), day = c("Wed", "Mon"))
lst2 <- list(month = c("Jul", "Aug"), day = c("Fri", "Sat"))
map2(lst1, lst2, ~ c(.x, .y))




###############

library(purrr)
df <- data.frame(
  x = c(8, 5), 
  y = c("P", "Q")
)
map(df, class)
map_chr(df, class)




###############

library(purrr)
fruits <- list(
  list(name = c("apple", "apricot"), stock = c(30, 20)), 
  list(name = c("date", "fig"), stock = c(55, 80))
)
fruits %>%
  map("name") %>%
  map_chr(1)



###############

library(purrr)
avg_temp <- data.frame(
  year =  c(2015, 2015, 2014, 2014),
  month = c("May", "Jun", "May", "Jun"), 
  temp =  c(26, 30, 25, 28)
)
avg_temp %>%
  split(.$year) %>%
  map("temp")




###############

random_words <- c("1..2a3bC", "15/2a_C", "v.a2/H")
gsub(pattern = "[\\._/]", replacement = "0", x = random_words)




###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############






###############
