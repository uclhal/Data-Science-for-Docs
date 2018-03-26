---
title: "Data Wrangling"
author: "Ahmed Al-Hindawi & Danny Wong"
date: "Last updated: 02 March 2018"
output: ioslides_presentation
---



## Learning Objectives

- Use the dplyr package to manipulate your data
    + Introduce logical operators
- The standard R methods for selecting data
- Some of our favourite (data wrangling) things
    + Wrangling strings
    + Wrangling dates
    + Columns to rows and back again


## Prerequisite

- Install the packages using `install.packages()`:
    + `dplyr` 
    + `lubridate` 
- Load the libraries
- Import the RCT dataset into an object called `RCT`

## First wrangle!

Type this into the console:

```r
library(dplyr)
filter(RCT, age >= 65)
```

Done! It _filters_ rows from the `RCT` data frame where `age` is >= `65`.

## Logical operators

- Most are obvious:
    + `>` (greater than), `>=` (greater than or equal to), and similarly for `<` and `<=`.
- Others are less so:
    + `!=` means Not Equal to...

## Logical operators 2

- Others are confusing:
    + `==` compares equality. Notice that there are two equal signs. This is because in R `=` means an assigment, you're _making_ somethign equal to something else:
    + `x = 6` means make the variable called `x` equal 6. If you then do `x == 8` is a question, _is_ x equal to 8? Here, the answer is a `FALSE`

## Let's rewrite 

```r
filter(RCT, age >= 65)
RCT %>% filter(age >= 65)
```

## What's that weird sign?!

The `%>%` operator (created by the _dplyr_ library) is called a **pipe**, and it (surprise, surprise) _pipes_ data from one command to the next. So in plain English, the above line _filters_ the data where the `age` is >= 65, then selects the Gender.

## Second Wrangle!

```r
RCT %>% filter(age >= 65) %>% select(gender)
```

- First filter the rows by a criterion:
    + we are interested in patients 65 and older (`>= 65`)
- Now select the gender column
- What we have left is a single column of Male/Female from a _subset_ of our data - namely ones that have an Age and are 65 and older

## What now?

Now that we have our data's _subset_, we can pass it onto other functions in R:

```r
RCT %>% filter(age >= 65) %>% 
  select(Gender) %>% summary()
```

This says, grab my data labeled `RCT`, filter the rows so that we only find patients who have an Age and are 65 and older, select the column called 'Gender'. With that column, give me a summary.

## What do you think this does?


```r
RCT %>% filter(age >= 65) %>% select(gender) %>% is.na() %>% sum()
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
RCT %>% group_by(gender) %>% summarise(age.avg = mean(age))
```
Sadly this won't work because `mean` has a little hissy fit if there are NA's in the data; fix:


```r
RCT %>% filter(is.na(age)==FALSE) %>%  group_by(gender) %>% 
  summarise(age.avg = mean(age))
```

## Practice some dplyr tidying recipes

- Open the course website: http://datascibc.org/Data-Science-for-Docs/
- Select Lesson: [Data Wrangling](http://datascibc.org/Data-Science-for-Docs/04-lesson-04-data-wrangling.html)
- Select [Some of our favourite (data wrangling) things](http://datascibc.org/Data-Science-for-Docs/04-lesson-04-data-wrangling.html#things) and do some practice
