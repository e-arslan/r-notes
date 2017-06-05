#In their most basic form, regular expressions can be used to see
#whether a pattern exists inside a character string or a vector of
#character strings. For this purpose, you can use:

#grepl(), which returns TRUE when a pattern is found in the 
#corresponding character string.
#grep(), which returns a vector of indices of the character 
#strings that contains the pattern.

#Both functions need a pattern and x argument, where pattern is 
#the regular expression you want to match for, and the x argument 
#is the character vector from which matches should be sought.

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern = 'edu', x = emails)

# Use grep() to match for "edu", save result to hits
hits = grep(pattern = 'edu', x = emails)

# Subset emails using hits
emails[hits]

#You can use the caret, ^, and the dollar sign, $ to match the content located in 
#the start and end of a string, respectively. 

#@, because a valid email must contain an at-sign.
#.*, which matches any character (.) zero or more times (*). Both the dot and the asterisk are metacharacters. You can use them to match any character between the at-sign and the ".edu" portion of an email address.
#\\.edu$, to match the ".edu" part of the email at the end of the string. The \\ part escapes the dot: it tells R that you want to use the . as an actual character.

# Use grepl() to match for .edu addresses more robustly
grepl(pattern = "@.*\\.edu",x = emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits = grep(pattern = '@.*\\.edu$',x=emails)

# Subset emails using hits
emails[hits]



# Suppose you want to see if a string x contains 3 or more digits in a row. Which grepl() call do you need?
grepl("\\d{3,}", x)




convert_name <- function(name) {
  # women: take name from inside parentheses
  if (grepl("\\(.*?\\)", name)) {
    gsub("^.*?\\((.*?)\\)$", "\\1", name)
    # men: take name before comma and after title
  } else {
    # Finish the gsub() function
    gsub("^(.*?),\\s[a-zA-Z\\.]*?\\s(.*?)$", "\\2 \\1", name)
  }
}

