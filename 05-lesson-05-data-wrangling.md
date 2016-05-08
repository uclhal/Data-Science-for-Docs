---
layout: lesson
root: .
title: Data wrangling
minutes: 25
---

<!-- rename file with the lesson name replacing template -->

## Learning Objectives 

- recognise the standard R methods for selecting data
- use the dplyr package to manipulate your data
- use the tidyr package to tidy your data

## Lesson 

### Subsetting in R

### dplyr

Let's start R

Now install and load the [dplyr package](https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)

~~~ R
install.packages("dplyr") 
library(dplyr)
~~~

Note that when you ask R to install a package you need to quote the name `"dplyr"`, but once installed the name now means something to R (it is a symbol for the package) and no longer needs quoting.

Now load your data. We're going to use the data set from the deteriorating patient study. We'll use the `read.csv` function, pass it the URL of our data, and label it with the name `ddata`.

~~~ R
# Read in the data from the internet
ddata <- read.csv("https://ndownloader.figshare.com/files/5094199?private_link=aff8f0912c76840c7526")

# How many rows
nrow(ddata)     # how many rows in the data table
names(ddata)    # what are the columns (fields) called
~~~

Have a look at the contents of this file

All being well you should see something like this:

~~~ R
# install.packages("dplyr") 
library(dplyr)

## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union

# ddata <- read.csv("https://ndownloader.figshare.com/files/5094199?private_link=aff8f0912c76840c7526")
ddata <- read.csv("/Users/steve/Sites/datascibc/course/data/outreach.csv")
nrow(ddata)

## [1] 1000

names(ddata)

##  [1] "hospital"    "patient"     "dead28"      "icu_accept"  "icu_admit"  
##  [6] "time2icu"    "early4"      "age"         "male"        "wday"       
## [11] "news_score"  "news_risk"   "sofa_score"  "hrate"       "bpsys"      
## [16] "temperature" "rrate"       "pf_ratio"    "creatinine"  "platelets"  
## [21] "avpu"        "lactate"

~~~

You already know how to ask simple questions of the data. Let's see have a look at the mean heart rate (the variable is `hrate`, but don't forget that you need to tell R the variable is in the `ddata` data frame by asking for `ddata$hrate`).

~~~ R
summary(ddata$hrate)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##      10      83     100     100     116     223     246
~~~


#### Data wrangling with base R

What if now you wanted to look at heart rate by NEWS Risk class (a ward based classification of severity of illness based on vital signs).

~~~ R
table(ddata$news_risk)

## 
##    0    1    2    3 
##   27 267 269 437 

summary(ddata[ddata$news_risk==3,]$hrate)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##      14      95     110     109     125     223      26
~~~

So this is starting to look ugly!

First, `table(ddata$news_risk)` inspects the news_risk variable. We have 4 levels from 0 to 3 corresponding to 'lowest', 'low', 'medium', and 'high' risk.

Next, we want to summarise heart rate for just patients in the highest risk class, and we type `summary(ddata[ddata$news_risk==3,]$hrate)`. Let's break this down. I'll focus on one bit at a time, and use `...` to indicate the missing pieces.

- `summary( ... )` 
 
You should have met the summary function already. OK so far?

If we wanted to summarise heart rate for the whole data frame we'd write `summary(ddata$hrate)`. 

But we don't. So instead we want to pick just those patients whose NEWS score is 3.

- ` ... news_risk==3 ...` 

Can you see this in the middle of the line of code? We are writing a comparison test that says does `news_risk` equal `3`. We use `==` not `=` when comparing otherwise R thinks you are _telling_ it that news_risk _is_ 3.

So we want to run this comparison on the data frame `ddata`.

- `... ddata[ddata$news_risk==3,] ...`

This is called subsetting. We take `ddata` and ask for some portion of it. Because `ddata` is a data frame (square table) then it has rows and columns. We choose rows and columns by specifyin `[row,column]`. So ...

`ddata[3,1]` is the top left cell (row 3, column 1) of the third row of data
`ddata[3, ]` is all of the third row
`ddata[ ,1]` is all of the first column

Now try 

~~~ R
ddata$news_risk

##  [1] 3 3 3 1 1 1 3 3 2 1 1 1 3 1 3 1 1 2 1 3 2 3 3 2 3 3 1 2 2 1 1 3 1 1 3 3 1 3 3 2 2 3 2 3 1 1 3 3 3 2 3 2 2 3 3 3 1 2 2 3 1
##  [62] 3 3 3 2 1 3 3 2 2 1 3 3 3 2 3 1 1 1 1 2 1 1 2 1 3 1 2 1 3 2 2 1 3 3 0 2 3 2 3 1 3 2 1 1 3 3 1 1 1 1 3 3 2 2 3 3 2 3 1 3 1
~~~

We get the news risk class for every row.

Next try

~~~ R
ddata$news_risk == 3
##   [1]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE
##  [21] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE
~~~

We get a list of True/False responses based on our test.

So `... ddata[ddata$news_risk==3,] ...` is simply wrapping the test inside the row selector. Notice the `,` after the test. That is telling R we want the test applied row-wise when selecting- which makes sense since the test is applied once per row for the column.

#### Data wrangling with dplyr

This makes sense, but it isn't easy to read, and it is very easy to forget. The `dplyr` package makes this a lot simpler.

~~~ R
filter(ddata, news_risk==3)
~~~

Done! This is equivalent to `ddata[ddata$news_risk==3,]`. We can all understand what it does immediately. It _filters_ rows from the `ddata` data frame where `news_risk` is equal to `3`.

Just want the heart rate colum? Then

~~~ R
select(ddata, hrate)
~~~

So `filter` chooses rows, and `select` chooses columns.

Now here comes the _proper_ magic. What if you want to both filter and select?

~~~ R
filter(ddata, news_risk==3) %>% select(hrate)
~~~

The `%>%` operator is called a **pipe**, and it (surprise, surprise) _pipes_ data from one command to the next. So in plain English, the above line _filters_ the data where the NEWS risk class is 3, then selects the heart rate from that filtered data.

An even better way to write this is ...

~~~ R
ddata %>% filter(news_risk==3) %>% select(hrate)
~~~


This says start with the data, then filter then select. Finally, you can pass the data you wrangle to almost any other function in R.

~~~ R
# Summarise
ddata %>% filter(news_risk==3) %>% select(hrate) %>% summary

# Count missing
ddata %>% filter(news_risk==3) %>% select(hrate) %>% is.na %>% sum
~~~


There are a small number of 'verbs' in the dplyr package that allow you to very simply perform a large number of useful functions. In addition to `select`, and `filter`, you will want to learn:

1. `group_by`
2. `summarise`

Combining these two is super useful.

~~~ R
# But no means reported? This is because mean() doesn't report if there is missing data.
ddata %>% group_by(news_risk) %>% summarise(hrate.avg = mean(hrate)

# The base R way of fixing this
ddata %>% group_by(news_risk) %>% summarise(hrate.avg = mean(hrate, na.rm=TRUE))

# The dplyr fix
ddata %>% filter(is.na(hrate)==FALSE) %>%  group_by(news_risk) %>% summarise(hrate.avg = mean(hrate))
~~~







### tidyr

## Exercises


### Questions

1. Try to summarise the mean mortality by day of the week in Excel. Can you see how R makes life easy

### Answers


---

[Previous topic]() --- [Next topic]()


