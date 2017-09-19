# PROJECT TITLE

# Description ====
# This is a template for doing data analysis in R
# Author:
# Start Date:

# To Do List ====
# [x] Finish this file
# [ ] Get feedback from course attendees on file

# Project Structure ====
# Before using this script, I will set up a folder structure that looks like this:
# |- my_project
#     |- data (folder containing any raw data for the project)
#         |- clean_data.csv
#     |- scripts (folder containing any scripts)
#         |- primary.r (note, this is THIS script)
#     |- plots (folder to output all my plots)
#     |- resources (a common resources folder)
#     |- manuscripts (a folder to output my formatted manuscripts)

# Load necessary libaries ====
library(tidyverse)
library(googlesheets)

# Make sure my working directory is set ===
getwd()

# Import data ====
my_data <- read_csv("data/raw_data.csv")

# Clean/Wrangle data ====
# will need to use a combination of:
#   Select() - to select columns of data
#   Filter() - to filter rows of data
#   Any other functions from the dplyr library

# Plot data ====
# will need to use ggplot2 to visually inspect data. The basic syntax is:

ggplot(data = my_data,
       mapping = aes(x = some_column_name_1,
                     y = some_column_name_2)) + geom_point()

# Apply some stats ====
t.test()