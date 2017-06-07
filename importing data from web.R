#read.csv() and read.delim(), are capable of automatically importing from URLs that point to flat files on the web.


# Load the readr package
library(readr)

# Import the csv file: pools
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv"
pools <- read_csv(url_csv)

# Import the txt file: potatoes
url_delim <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/potatoes.txt"
potatoes <- read_tsv(url_delim)

# Print pools and potatoes
pools
potatoes


#In the previous exercises, you have been working with URLs that all start with http://. There is, however, a safer alternative to HTTP, namely HTTPS, which stands for HypterText Transfer Protocol Secure. Just remember this: HTTPS is relatively safe, HTTP is not.
#Luckily for us, you can use the standard importing functions with https:// connections since R version 3.2.2.

# https URL to the swimming_pools csv file.
url_csv <- "https://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv"

# Import the file using read.csv(): pools1
pools1 <- read.csv(url_csv)

# Load the readr package
library(readr)

# Import the file using read_csv(): pools2
pools2 <- read_csv(url_csv)

# Print the structure of pools1 and pools2
str(pools1)
str(pools2)


#When you learned about gdata, it was already mentioned that gdata can handle .xls files that are on the internet. readxl can't, at least not yet. The URL with which you'll be working is already available in the sample code. You will import it once using gdata and once with the readxl package via a workaround.

# Load the readxl and gdata package
library(readxl)
library(gdata)

# Specification of url: url_xls
url_xls <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/latitude.xls"

# Import the .xls file with gdata: excel_gdata
excel_gdata <- read.xls(url_xls)

# Download file behind URL, name it local_latitude.xls
download.file(url_xls,destfile = "local_latitude.xls")

# Import the local .xls file with readxl: excel_readxl
excel_readxl <- read_excel("local_latitude.xls")


#There's more: with download.file() you can download any kind of file from the web, using HTTP and HTTPS: images, executable files, but also .RData files. An RData file is very efficient format to store R data

#You can load data from an RData file using the load() function, but this function does not accept a URL string as an argument.


# https URL to the wine RData file.
url_rdata <- "https://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/wine.RData"

# Download the wine file to your working directory
download.file(url_rdata,"wine_local.RData")

# Load the wine data into your workspace using load()
load('wine_local.RData')

# Print out the summary of the wine data
summary(wine)


#Downloading a file from the Internet means sending a GET request and receiving the file you asked for. Internally, all the previously discussed functions use a GET request to download files.

#httr provides a convenient function, GET() to execute this GET request. The result is a response object, that provides easy access to the status code, content-type and, of course, the actual content.

#You can extract the content from the request using the content() function. At the time of writing, there are three ways to retrieve this content: as a raw object, as a character vector, or an R object, such as a list. If you don't tell content() how to retrieve the content through the as argument, it'll try its best to figure out which type is most appropriate based on the content-type.

# Load the httr package
library(httr)

# Get the url, save response to resp
url <- "http://www.example.com/"
resp <- GET(url)

# Print resp
resp

# Get the raw content of resp: raw_content
raw_content <- content(resp,as = 'raw')

# Print the head of raw_content
head(raw_content)


#Web content does not limit itself to HTML pages and files stored on remote servers such as DataCamp's Amazon S3 instances. There are many other data formats out there. A very common one is JSON. This format is very often used by so-called Web APIs, interfaces to web servers with which you as a client can communicate to get or store information in more complicated ways.

# httr is already loaded

# Get the url
url <- "http://www.omdbapi.com/?apikey=ff21610b&t=Annie+Hall&y=&plot=short&r=json"
resp <- GET(url)

# Print resp
resp
# Print content of resp as text
content(resp,as='text')

# Print content of resp
content(resp)

#In the simplest setting, fromJSON() can convert character strings that represent JSON data into a nicely structured R list.

# Load the jsonlite package
library(jsonlite)

# wine_json is a JSON
wine_json <- '{"name":"Chateau Migraine", "year":1997, "alcohol_pct":12.4, "color":"red", "awarded":false}'

# Convert wine_json into a list: wine
wine = fromJSON(wine_json)

# Print structure of wine
str(wine)


# jsonlite is preloaded

# Definition of quandl_url
quandl_url <- "http://www.quandl.com/api/v1/datasets/IWS/INTERNET_INDIA.json?auth_token=i83asDsiWUUyfoypkgMz"

# Import Quandl data: quandl_data
quandl_data = fromJSON(quandl_url)

# Print structure of quandl_data
str(quandl_data)


# The package jsonlite is already loaded

# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?apikey=ff21610b&i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?apikey=ff21610b&i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)

# Print out the Title element of both lists
sw4$Title
sw3$Title

# Is the release year of sw4 later than sw3?
sw4$Year > sw3$Year


#JSON is built on two structures: objects and arrays.

# jsonlite is already loaded

# Challenge 1
json1 <- '[1, 2,3, 4,5, 6]'
fromJSON(json1)

# Challenge 2
json2 <- '{"a": [1, 2, 3],"b":[4,5,6]}'
fromJSON(json2)

# jsonlite is already loaded

# Challenge 1
json1 <- '[[1, 2], [3, 4]]'
fromJSON(json1)

# Challenge 2
json2 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4},{"a":5,"b":6}]'
fromJSON(json2)


#Apart from converting JSON to R with fromJSON(), you can also use toJSON() to convert R data to a JSON format. In its most basic use, you simply pass this function an R object to convert to a JSON. The result is an R object of the class json, which is basically a character string representing that JSON.


# jsonlite is already loaded

# URL pointing to the .csv file
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/water.csv"

# Import the .csv file located at url_csv
water = read.csv(url_csv,stringsAsFactors = F)

# Convert the data file according to the requirements
water_json <- toJSON(water)

# Print out water_json
water_json


# jsonlite is already loaded

# Convert mtcars to a pretty JSON: pretty_json
pretty_json <- toJSON(mtcars,pretty = T)

# Print pretty_json
pretty_json

# Minify pretty_json: mini_json
mini_json <- minify(pretty_json)

# Print mini_json
mini_json






