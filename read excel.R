
#The read_excel() function is called multiple times on the "data.xlsx" file and each sheet is loaded in one after the other. The result is a list of data frames, each data frame representing one of the sheets in data.xlsx.

my_workbook <- lapply(excel_sheets("data.xlsx"),
                      read_excel,
                      path = "data.xlsx")


#When working with XLConnect, the first step will be to load a workbook in your R session with loadWorkbook(); this function will build a "bridge" between your Excel file and your R session.
# urbanpop.xlsx is available in your working directory

# Load the XLConnect package
library(XLConnect)

# Build connection to urbanpop.xlsx: my_book 
my_book = loadWorkbook('urbanpop.xlsx') 


# Print out the class of my_book
class(my_book)


#Just as readxl and gdata, you can use XLConnect to import data from Excel file into R.
#To list the sheets in an Excel file, use getSheets(). To actually import data from a sheet, you can use readWorksheet(). Both functions require an XLConnect workbook object as the first argument.

# XLConnect is already available

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("urbanpop.xlsx")

# List the sheets in my_book
getSheets(my_book)

# Import the second sheet in my_book
readWorksheet(my_book,sheet=2)


# XLConnect is already available

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("urbanpop.xlsx")

# Import columns 3, 4, and 5 from second sheet in my_book: urbanpop_sel
urbanpop_sel <- readWorksheet(my_book, sheet = 2,startCol = 3,endCol = 5)

# Import first column from second sheet in my_book: countries
countries = readWorksheet(my_book,sheet=2,startCol=1,endCol=1)

# cbind() urbanpop_sel and countries together: selection
selection <- cbind(countries,urbanpop_sel)


# XLConnect is already available

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("urbanpop.xlsx")

# Add a worksheet to my_book, named "data_summary"
createSheet(my_book,name = 'data_summary')

# Use getSheets() on my_book
getSheets(my_book)


# XLConnect is already available

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("urbanpop.xlsx")

# Add a worksheet to my_book, named "data_summary"
createSheet(my_book, "data_summary")

# Create data frame: summ
sheets <- getSheets(my_book)[1:3]
dims <- sapply(sheets, function(x) dim(readWorksheet(my_book, sheet = x)), USE.NAMES = FALSE)
summ <- data.frame(sheets = sheets,
                   nrows = dims[1, ],
                   ncols = dims[2, ])

# Add data in summ to "data_summary" sheet
writeWorksheet(my_book,summ,sheet = 'data_summary')

# Save workbook as summary.xlsx
saveWorkbook(my_book,file='summary.xlsx')


# my_book is available

# Rename "data_summary" sheet to "summary"
renameSheet(my_book,'data_summary','summary')

# Print out sheets of my_book
getSheets(my_book)

# Save workbook to "renamed.xlsx"
saveWorkbook(my_book,file='renamed.xlsx')

# Load the XLConnect package
library(XLConnect)

# Build connection to renamed.xlsx: my_book
my_book = loadWorkbook('renamed.xlsx')

# Remove the fourth sheet
removeSheet(my_book,sheet = 'summary')

# Save workbook to "clean.xlsx"
saveWorkbook(my_book,file='clean.xlsx')


