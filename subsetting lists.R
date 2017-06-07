
#my_list[[1]] extracts the first element of the list my_list, and my_list[["name"]] extracts the element in my_list that is called name. If the list is nested you can travel down the heirarchy by recursive subsetting. For example, mylist[[1]][["name"]] is the element called name inside the first element of my_list

# 2nd element in tricky_list
typeof(tricky_list[[2]])

# Element called x in tricky_list
typeof(tricky_list[["x"]])

# 2nd element inside the element called x in tricky_list
typeof(tricky_list[["x"]][[2]])


#Often you won't know exactly what is inside a list. But, you'll need to figure it out to get some useful piece of data. Extracting elements from the output of the names() and str() functions is a great way to explore the structure of a list.

#Calling names() on a list will give you names at the top level of the list and str() will give you a full description of the entire list (which can sometimes be a little overwhelming).

# Guess where the regression model is stored
names(tricky_list)

# Use names() and str() on the model element
names(tricky_list[['model']])
str(tricky_list[["model"]])

# Subset the coefficients element
tricky_list[["model"]][["coefficients"]]

# Subset the wt element
tricky_list[["model"]][["coefficients"]][["wt"]]



# Replace the 1:ncol(df) sequence
for (i in seq_along(df)) {
  print(median(df[[i]]))
}

# Change the value of df
df <- data.frame()

# Repeat for loop to verify there is no error
for (i in seq_along(df)) {
  print(median(df[[i]]))
}


# Create new double vector: output
output <- vector("double",ncol(df))

# Alter the loop
for (i in seq_along(df)) {
  # Change code to store result in output
  output[i] = median(df[[i]])
}

# Print output
output


#The official R way to supply simple diagnostic information is the message() function. The unnamed arguments are pasted together with no separator (and no need for a newline at the end) and by default are printed to the screen.


replace_missings <- function(x, replacement) {
  is_miss <- is.na(x)
  x[is_miss] <- replacement
  
  # Rewrite to use message()
  
  message(paste(sum(is_miss)," missings replaced by the value ",replacement))
  x
}



