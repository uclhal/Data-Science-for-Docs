library(googlesheets)
library(dplyr)

ddata <- gs_url("https://docs.google.com/spreadsheets/d/1phoNhmy4aVb7QHYV9uHH7l9hKRRZcAdOY8eK1sqPzFo/edit?usp=sharing") %>% gs_read_csv()
