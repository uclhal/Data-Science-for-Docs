# PROJECT TITLE

# Description ====
# This is a template for doing data analysis in R
# Author:
# Start Date:
# Version: 0.3

# To Do List ====
# [x] Finish this file
# [x] Get feedback from course attendees on file
# [ ] Set up my project folder structure
# [ ] Do an exploratory analysis using plots to visualise the data

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
#     readme.r (lives in my main directory and contains a dictionary of wierd stuff that I might forget)

# Load necessary libaries ====
# install.packages() i'll need this function if I haven't downloaded the package yet
library(tidyverse) # loads in everything I tend to use on a daily basis
library(googlesheets)

# Make sure my working directory is set ===
getwd()
# can use setwd() to change if needed

# Import data ====
rct_data <- read_csv(file.choose())

# Clean/Wrangle data ====
# will need to use a combination of:
#   select() - to select columns of data
#   filter() - to filter rows of data
#   Any other functions from the dplyr library

# Select a subset of the data
rct_data_small <- select(rct_data, age, random, ps0h, los)

# modify a single column to a different data type
rct_data_small$random <- as.factor(rct_data_small$random)

# Changing multiple columns at once:
# We'll use the "mutate each" function

rct_data <- rct_data %>%
  mutate_at(vars(ps0h, ps3h, ps12), funs(as.factor))

# Remember the pipe "%>%" forces whatever is on the left,
# into the first arugment position of the function on its right

# Plot data ====
# will need to use ggplot2 to visually inspect data. The basic syntax is:

ggplot(data = rct_data_small,
       mapping = aes(x = age,
                     y = los,
                     shape = random,
                     color = ps0h)) +
  geom_point() +
  ggtitle("Fun with Plots") +
  theme_bw()

ggplot(data = my_data,
       mapping = aes(x = some_column_name_1,
                     y = some_column_name_2)) + geom_point()

# Apply some stats ====
t.test(x = rct_data_small$ps0h[rct_data_small$random == "drain"],
       y = rct_data_small$ps0h[rct_data_small$random == "skin"])

# Why does the above work?
