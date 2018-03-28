---
title: "Data Wrangling"
author: "Ahmed Al-Hindawi & Danny Wong"
date: "Last updated: 28 March 2018"
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

## Second Wrangle!

```r
RCT_1 <- filter(RCT, age >= 65) 
RCT_2 <- select(RCT_1, gender)
table(RCT_2)

table(select(filter(RCT, age >= 65), gender))
```
- First we filter the rows by a criterion:
    + we are interested in patients 65 and older (`>= 65`)
- We then assign that to an named object `RCT_1`
- We then select the gender column and assign that to `RCT_2`, and create a table from that
- What we have left is a single column of Male/Female from a _subset_ of our data - namely ones that have an Age and are 65 and older

## Is there a better way?

```r
filter(RCT, age >= 65)
RCT %>% filter(age >= 65)

# RCT_1 <- filter(RCT, age >= 65) 
# RCT_2 <- select(RCT_1, gender)
# table(RCT_2)
#
# table(select(filter(RCT, age >= 65), gender))
```

## What's that weird sign?!

The `%>%` operator (created by the _dplyr_ library) is called a **pipe**, and it (surprise, surprise) _pipes_ data from one command to the next. So in plain English, the above line _filters_ the data where the `age` is >= 65, then selects the Gender.

## What now?

Now that we have our data's _subset_, we can pass it onto other functions in R:

```r
RCT %>% filter(age >= 65) %>% 
  select(gender) %>% table()
```

This says, grab my data labeled `RCT`, filter the rows so that we only find patients who have an Age and are 65 and older, select the column called `gender`. With that column, make me a summary.

## Other dplyr methods

- In Addition to filter and select, there are:
    + `arrange` --> sorts rows
    + `distinct` --> finds unique values 
    + `mutate` --> creates a new column based on some parameters. _Hint_: you can use other column names here, useful for finding out the Age of patients, length of time they were in hospital...etc
    + `recode` --> helps you recode values which might have been mislabelled
    + `group_by` --> This one is great!!

## Let's practice

```r
RCT %>% arrange(age)
RCT %>% arrange(desc(age))

RCT %>% select(gender) %>% distinct()

RCT %>% filter(age >= 65) %>% select(gender) %>% 
  mutate(gender = recode(gender, f = "F"))
```
    
## Group-by

It breaks down a dataset into specified groups of rows. When you then apply the verbs above on the resulting object they’ll be automatically applied “by group”. Most importantly, all this is achieved by using the same exact syntax you’d use with an ungrouped object.

```r
RCT %>% group_by(gender) %>% summarise(age_avg = mean(age))
```

Sadly this won't work because `mean` has a little hissy fit if there are NA's in the data; fix:

```r
RCT %>%  group_by(gender) %>% 
  summarise(age_avg = mean(age, na.rm = TRUE))
```

## Putting things together

How do we combine all these steps to get insight into the data? 

Since this RCT looking at the effects of having a drain vs having skin infiltration on postop pain, let's see what the mean change in pain scores is at 24h vs baseline:

```r
RCT %>% mutate(ps_change = ps24h - ps0h) %>% 
  group_by(random) %>%
  summarise(mean_ps_change = mean(ps_change, na.rm = TRUE))
  
RCT$ps_change <- RCT$ps24h - RCT$ps0h

drain <- filter(RCT, random == "drain")
mean(drain$ps_change, na.rm = TRUE)

skin <- filter(RCT, random == "skin")
mean(skin$ps_change, na.rm = TRUE)
```

## Practice some dplyr tidying recipes

- Open the course website: http://datascibc.org/Data-Science-for-Docs/
- Select Lesson: [Data Wrangling](http://datascibc.org/Data-Science-for-Docs/04-lesson-04-data-wrangling.html)
- Select [Some of our favourite (data wrangling) things](http://datascibc.org/Data-Science-for-Docs/04-lesson-04-data-wrangling.html#things) and do some practice
