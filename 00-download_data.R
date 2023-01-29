#### Preamble ####
# Purpose: Clean the survey data downloaded from Open Data Toronto 
# Author: Ruibo Sun
# Data: 29 January 2023
# Contact: ruibo.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours



#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)

# Read in the raw data. 
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("64b54586-6180-4485-83eb-81e8fae3b8fe")
package

# get all resources for this package
resources <- list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
# Just keep some variables that may be of interest (change 
# this depending on your interests)
data<-raw_data%>%select(`Age Group`,`Source of Infection`, `Client Gender`,Outcome)


#### What's next? ####
sum(is.na(data$`Age Group`))
sum(is.na(data$`Source of Infection`))
sum(is.na(data$`Client Gender`))
sum(is.na(data$Outcome))
# there is no NA in this data set, and no need to clean it



