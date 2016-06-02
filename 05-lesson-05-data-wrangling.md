---
layout: lesson
root: .
title: Data wrangling
minutes: 25
---

<!-- rename file with the lesson name replacing template -->
<!-- - [ ] TODO(2016-05-10): remove detail from the subsetting in Base R; just show the ugly line, maybe mention matrix address  -->
<!-- - [ ] TODO(2016-06-02): cheat sheets -->

## Learning Objectives 

<!--     * Tidying data in R - (v1) Ahmed (v2) Steve
        - [ ] dplyr
        - [ ] tidyr
 -->
- [Recognise the standard R methods for selecting data](#base-r)
- [Use the dplyr package to manipulate your data](#dplyr)
- [Some of our favourite (data wrangling) things](#things)
    + [Wrangling strings](#stringr)
    + [Wrangling dates](#lubridate)
    + [Columns to rows and back again](#tidyr)

## Lesson 

This lesson builds on the [Excel Hell](02-lesson-02-excel-hell.html) lesson in that to describe, plot, and test your data you need it to be 'tidy'.

To [quote](https://blog.rstudio.org/2014/07/22/introducing-tidyr/) one of R's current chief architects (Hadley Wickham):

> Each column is a variable.
> Each row is an observation.

This requires some data tidying (see the [favourite things recipes](#things)) below, and the some data manipulation. We're going to start with data manipulation.


<a name="base-r"></a>

### Wrangling the 'base' R way


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
ddata <- read.csv("https://ndownloader.figshare.com/files/5094199?private_link=aff8f0912c76840c7526")

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

So this is starting to look ugly! You 'll remember parts of this from the [first lesson](00-lesson-00-intro.html) where we introduced the ideas of vectors and matrices. And that to 'R' everything is a vector. To work with 'bits' of data, we therefore need to specify the 'address' of the data.

In this example, the first code snippet `table(ddata$news_risk)` inspects the news_risk variable. We have 4 levels from 0 to 3 corresponding to 'lowest', 'low', 'medium', and 'high' risk.

Next, we want to summarise heart rate for just patients in the highest risk class, and we type `summary(ddata[ddata$news_risk==3,]$hrate)`. Let's break this down. I'll focus on one bit at a time, and use `...` to indicate the missing pieces.

- `summary( ... )` 
 
You should have met the summary function already. OK so far?

If we wanted to summarise heart rate for the whole data frame we'd write `summary(ddata$hrate)`. 

But we don't. So instead we want to pick just those patients whose NEWS score is 3.

- ` ... news_risk==3 ...` 

Can you see this in the middle of the line of code? We are writing a comparison test that says does `news_risk` equal `3`. We use `==` not `=` when comparing otherwise R thinks you are _telling_ it that news_risk _is_ 3.

> **TIP:** Comparisons in R: Most of these are obvious `>` (greater than), `>=` (greater than or equal to), and similarly for `<` and `<=`. We have also mentioned previously the `!=` operator means 'not equal to'. But when we want to check if something _is_ equal to something else we _must_ use `==`. Why? Because although R prefers you to use `<-` when you name things, most programming languages use `=`, and even R expects you to use `=` when you pass values to functions. So, for a function such as `mean(x)` we are normally lazy when we write `mean(hrate)`. We should write `mean(x=hrate)`, because _inside_ the function all the work is done with the variable `x`. When we write `mean(x=hrate)` we explicitly telling R that we want it to use `hrate` in place of `x`. This is a very long winded way of saying that when you want to _test_ if one thing is equal to another then you need a different way of writing this, hence `==`.
 
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

<a name="dplyr"></a>

### Data wrangling with dplyr

This makes sense, but it isn't easy to read, and it is very easy to forget. Again, the `dplyr` package makes this a lot simpler.

Now let's _filter_ by row.

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

The `%>%` operator (created by the _dplyr_ library) is called a **pipe**, and it (surprise, surprise) _pipes_ data from one command to the next. So in plain English, the above line _filters_ the data where the NEWS risk class is 3, then selects the heart rate from that filtered data.

An even better way to write this is ...

~~~ R
ddata %>% filter(news_risk==3) %>% select(hrate)
~~~

This says start with the data, then filter then select.

> **TIP:** The order matters in a pipe! So while `ddata %>% filter(news_risk==3) %>% select(hrate)` works fine, `ddata %>% select(hrate) %>% filter(ddata, news_risk==3)` will fail. This is because you selected _just_  `hrate` and then asked for a filter on `news_risk` which no longer exists (since you _only_ selected `hrate`). 

Next, you can pass the data you wrangle to almost any other function in R.

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
ddata %>% group_by(news_risk) %>% summarise(hrate.avg = mean(hrate))

# A base R way of fixing this
ddata %>% group_by(news_risk) %>% summarise(hrate.avg = mean(hrate, na.rm=TRUE))

# A dplyr fix
ddata %>% filter(is.na(hrate)==FALSE) %>%  group_by(news_risk) %>% summarise(hrate.avg = mean(hrate))
~~~

Both fixes work, but I would argue that one is easier to read.

- [ ] TODO(2016-06-02): add in exercises

<a name="things"></a>

### Some of our favourite things: Data tidying recipes

#### Load dplyr

First install (if you haven't already) then load the [dplyr package](https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)

~~~ R
install.packages("dplyr") 
library(dplyr)
~~~

> **TIP:** Note that when you ask R to install a package you need to quote the name `"dplyr"`, but once installed the name now means something to R (it is a symbol for the package) and no longer needs quoting.

##### Load the example data

Now load a 'semi-clean' version of the breast RCT data. All we have done in Excel, is clean up the column names, made a single 'header' row, and removed the merge cells. We'll do the rest of the work together.

Let's read the data. Note that we pass an _option `stringsAsFactors=FALSE` to the `read.csv()` function. We _highly_ recommend that you always do this when bringing in data.

~~~ R
bb.raw <- read.csv("https://ndownloader.figshare.com/files/5325343?private_link=28e6b022c0d3fe63909e", stringsAsFactors=FALSE)
str(bb.raw)
~~~

#### Recipe 1: Re-name a variable

~~~ R
names(bb.raw)
bb.raw <- rename(bb.raw, para = tylenol)
names(bb.raw)
~~~

We're using the rename function from the dplyr package, and then 'overwriting' our existing data with the renamed data. It might be better practice to create a new 'clean' data set.

Can you do this?


#### Recipe 2: Extract numbers

If we look at the paracetamol data, we see that it is stored with the 'units'. We want just the number. We are going to use a function from the [tidyr](https://blog.rstudio.org/2014/07/22/introducing-tidyr/) package called `extract_numeric()`.

~~~ R
# install.packages("tidyr")  # if you haven't already
library(tidyr)
# Look at the raw data
bb.raw$para 
# Try the function
extract_numeric(bb.raw$para)
# Now make a clean data set
bb.clean <- bb.raw %>% mutate(para = extract_numeric(para))
bb.clean$para 
~~~

#### Recipe 3: Extract a 'string'

This time you want to identify patients who take diclofenac. So another package! Please load [stringr](https://github.com/hadley/stringr). 


~~~ R
# install.packages("stringr")  # if you haven't already
library(stringr)
# Look at the raw data
bb.raw$other
# Try the function
str_detect(bb.raw$other, "diclofenac")
str_detect(bb.raw$other, "Diclofenac")
~~~

Can you see how R is case sensitive? Compare the following.

~~~ R
bb.raw %>% select(other) 
bb.raw %>% select(other) %>% mutate(other = str_to_lower(other))
~~~

Can you put this together to produce the data you want?

~~~ R
bb.raw %>% mutate(diclofenac = str_detect(str_to_lower(other), "diclofenac"))
# And to save your data
bb.clean <- bb.raw %>% mutate(diclofenac = str_detect(str_to_lower(other), "diclofenac")) 
bb.clean
~~~

Now you try to pick out patients getting ibuprofen.








<a name="stringr"></a>

#### Wrangling strings

<a name="lubridate"></a>

#### Wrangling dates

<a name="tidyr"></a>

#### Columns to rows and back again

> tidyr is new package that makes it easy to "tidy" your data. Tidy data is data that's easy to work with: it's easy to munge (with dplyr), visualise (with ggplot2 or ggvis) and model (with R's hundreds of modelling packages). The two most important properties of tidy data are:
> 
> Each column is a variable.
> Each row is an observation.


- gather (wide to long)
- separate (regular expression for position)
    - extract_numeric
    - extract (regular expression groups)
- spread (complement of separate)
- fill

?? ### stringr

- str_to_lower
- str_to_title
- str_split
- str_detect

?? ### lubridate

instants vs time spans
parsing (reading) dates
    ymd
    dmy
    mdy_hm
    etc
extracting components
    second
    minute
    day

rounding dates


## Exercises


### Questions

1. Try to summarise the mean mortality by day of the week in Excel. Can you see how R makes life easy

### Answers


---

[Previous topic]() --- [Next topic]()


