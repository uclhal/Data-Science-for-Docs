---
title: "Data Wrangling"
author: "Ahmed Al-Hindawi"
date: "29/11/2016"
output: ioslides_presentation
---



## Learning Objectives

- Use the dplyr package to manipulate your data
- The standard R methods for selecting data
- Some of our favourite (data wrangling) things
    + Wrangling strings
    + Wrangling dates
    + Columns to rows and back again


## Prerequisite

- Install the packages:
    + `dplyr` 
    + `lubridate` 
    + `stringr`
- Import them into a new worksheet
- Import the RCT dataset into a `ddata` variable

## First wrangle!

Type this into the console:

```r
filter(ddata, is.na(age) == FALSE, age >= 65)
```

Done! It _filters_ rows from the `ddata` data frame where `age` is NOT NOT a number (therefore is a number, so we get rid of empty fields) and the age is >= `65`.

## Comparisons in R (and most other languages too!)

- Most are obvious:
    + `>` (greater than), `>=` (greater than or equal to), and similarly for `<` and `<=`.
- Others are less so:
    + `!=` means Not Equal to...
- Others are confusiong:
    + `==` compares equality. Notice that there are two equal signs. This is because in R `=` means an assigment, you're _making_ somethign equal to something else:
    + `x = 6` means make the variable called `x` equal 6. If you then do `x == 8` is a question, _is_ x equal to 8? Here, the answer is a `FALSE`

## Second Wrangle!


```r
filter(ddata, is.na(age) == FALSE, age >= 65) %>% select(gender)
```

- First filter the rows by two criteria:
    + we only want rows that have an Age variable in them - so exclude ones that are not a number
    + we are also interested in patients 65 and older (`>= 65`)
- Now select the gender column
- What we have left is a single column of Male/Female from a _subset_ of our data - namely ones that have an Age and are 65 and older

## What's that weird sign?!

The `%>%` operator (created by the _dplyr_ library) is called a **pipe**, and it (surprise, surprise) _pipes_ data from one command to the next. So in plain English, the above line _filters_ the data where the Age  is NOT NOT a  number (i.e. is a number!) and that the Age is >= 65, then selects the Gender.

An even better way to write this is ...


```r
ddata %>% filter(is.na(Age) == FALSE, age >= 65) %>% select(gender)
```

## What now?

Now that we have our data's _subset_, we can pass it onto other functions in R:


```r
ddata %>% filter(is.na(age) == FALSE, age >= 65) %>% 
  select(Gender) %>% summary
```

This says, grab my data labeled `ddata`, filter the rows so that we only find patients who have an Age and are 65 and older, select the column called 'Gender'. With that column, give me a summary.

## What do you think this does?


```r
ddata %>% filter(age >= 65) %>% select(gender) %>% is.na %>% sum
```

Use the post-its when arrived at the answer:
- Green if you've got it
- Red if you haven't

## Other dplyr methods

- In Addition to filter and select, there are:
    + `arrange` --> sorts rows
    + `distinct` --> finds unique values 
    + `mutate` --> creates a new column based on some parameters. _Hint_: you can use other column names here, useful for finding out the Age of patients, length of time they were in hospital...etc
    + `group_by` --> This one is great!!
    
## Group-by
It breaks down a dataset into specified groups of rows. When you then apply the verbs above on the resulting object they’ll be automatically applied “by group”. Most importantly, all this is achieved by using the same exact syntax you’d use with an ungrouped object.


```r
ddata %>% group_by(gender) %>% summarise(age.avg = mean(age))
```
Sadly this won't work because `mean` has a little hissy fit if there are NA's in the data; fix:


```r
ddata %>% filter(is.na(age)==FALSE) %>%  group_by(gender) %>% 
  summarise(age.avg = mean(age))
```
