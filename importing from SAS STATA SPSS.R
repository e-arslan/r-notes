
#haven is an extremely easy-to-use package to import data from three software packages: SAS, STATA and SPSS. Depending on the software, you use different functions:
#   SAS: read_sas()
#   STATA: read_dta() (or read_stata(), which are identical)
#   SPSS: read_sav() or read_por(), depending on the file type.

# Load the haven package
library(haven)

# Import sales.sas7bdat: sales
sales = read_sas("sales.sas7bdat")

# Display the structure of sales
str(sales)

# haven is already loaded

# Import the data from the URL: sugar
sugar <- read_dta("http://assets.datacamp.com/production/course_1478/datasets/trade.dta")

# Structure of sugar
str(sugar)

# Convert values in Date column to dates
sugar$Date <- as.Date(as_factor(sugar$Date))

# Structure of sugar again
str(sugar)


#The haven package can also import data files from SPSS. Again, importing the data is pretty straightforward. Depending on the SPSS data file you're working with, you'll need either read_sav() - for .sav files - or read_por() - for .por files.

# haven is already loaded

# Import person.sav: traits
traits <- read_sav("person.sav")

# Summarize traits
summary(traits)

# Print out a subset
subset(traits,Extroversion > 40 & Agreeableness > 40)

# haven is already loaded

# Import SPSS data from the URL: work
work <- read_sav("http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/employee.sav")

# Display summary of work$GENDER
summary(work$GENDER)


# Convert work$GENDER to a factor
work$GENDER <- as_factor(work$GENDER)


# Display summary of work$GENDER again
summary(work$GENDER)




#The foreign package offers a simple function to import and read STATA data: read.dta().
# Load the foreign package
library(foreign)

# Import florida.dta and name the resulting data frame florida
florida <- read.dta("florida.dta")

# Check tail() of florida
tail(florida,6)

# foreign is already loaded

# Specify the file path using file.path(): path
path <- file.path("worldbank","edequality.dta")

# Create and print structure of edu_equal_1
edu_equal_1 <- read.dta(path)
str(edu_equal_1)
# Create and print structure of edu_equal_2
edu_equal_2 <- read.dta(path,convert.factors = F)
str(edu_equal_2)

# Create and print structure of edu_equal_3
edu_equal_3 <- read.dta(path,convert.underscore = T)
str(edu_equal_3)


# foreign is already loaded

# Import international.sav as a data frame: demo
demo <- read.spss("international.sav",to.data.frame = T)

# Create boxplot of gdp variable of demo
boxplot(demo$gdp)

# foreign is already loaded

# Import international.sav as demo_1
demo_1 <- read.spss("international.sav",to.data.frame = T)

# Print out the head of demo_1
head(demo_1)

# Import international.sav as demo_2
demo_2 <- read.spss("international.sav",to.data.frame = T, use.value.labels = F)

# Print out the head of demo_2
head(demo_2)

