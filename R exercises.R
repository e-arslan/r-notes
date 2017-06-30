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




###############




###############
