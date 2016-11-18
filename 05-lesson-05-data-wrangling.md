---
layout: lesson
root: .
title: Data wrangling
minutes: 40
---

<!-- rename file with the lesson name replacing template -->
<!-- - [ ] TODO(2016-05-10): remove detail from the subsetting in Base R; just show the ugly line, maybe mention matrix address  -->
<!-- - [ ] TODO(2016-06-02): cheat sheets -->

## Learning Objectives 

<!--     * Tidying data in R - (v1) Ahmed (v2) Steve
        - [ ] dplyr
        - [ ] tidyr
 -->
- [Use the dplyr package to manipulate your data](#dplyr)
- [The standard R methods for selecting data](#base-r)
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




<a name="dplyr"></a>

### Data wrangling with dplyr
The `dplyr` package provides useful _grammar_ for simplifying data wrangling/manipulation. It is not needed but makes manipulation verbose and intuitive and is highly recommended.

Go ahead and install the `dplyr` package if you haven't already done so:

~~~ R
install.packages("dplyr")
~~~

You only need to do this once as it installs the package locally for use with as many scripts as you like.

At the top of your script, tell R that you'd like to use `dplyr`:

~~~ R
# Notice that there are no quotes here:
library(dplyr)
~~~


Go ahead now and import our analgesia following breast surgery RCT data and name the data frame `ddata` (data is 'reserved' word in R hence we can't use it)

Now let's _filter_ by row.

~~~ R
filter(ddata, is.na(Age) == FALSE, Age >= 65)
~~~

Done! It _filters_ rows from the `ddata` data frame where `Age` is NOT NOT a number (therefore is a number, so we get rid of empty fields) and the Age is >= `65`.

> **TIP:** Comparisons in R: Most of these are obvious `>` (greater than), `>=` (greater than or equal to), and similarly for `<` and `<=`. We have also mentioned previously the `!=` operator means 'not equal to'. But when we want to check if something _is_ equal to something else we _must_ use `==`. Why? Because although R prefers you to use `<-` when you name things, most programming languages use `=`, and even R expects you to use `=` when you pass values to functions. So, for a function such as `mean(x)` we are normally lazy when we write `mean(hrate)`. We should write `mean(x=hrate)`, because _inside_ the function all the work is done with the variable `x`. When we write `mean(x=hrate)` we explicitly telling R that we want it to use `hrate` in place of `x`. This is a very long winded way of saying that when you want to _test_ if one thing is equal to another then you need a different way of writing this, hence `==`.

Just want the Gender colum? Then

~~~ R
select(ddata, Gender)
~~~

So `filter` chooses rows, and `select` chooses columns.

Now here comes the _proper_ magic. What if you want to both filter and select?

~~~ R
filter(ddata, is.na(Age) == FALSE, Age >= 65) %>% select(Gender)
~~~

The `%>%` operator (created by the _dplyr_ library) is called a **pipe**, and it (surprise, surprise) _pipes_ data from one command to the next. So in plain English, the above line _filters_ the data where the NEWS risk class is 3, then selects the heart rate from that filtered data.

An even better way to write this is ...

~~~ R
ddata %>% filter(is.na(Age) == FALSE, Age >= 65) %>% select(Gender)
~~~

This says start with the data, then filter then select.

> **TIP:** The order matters in a pipe! So while `ddata %>% filter(news_risk==3) %>% select(hrate)` works fine, `ddata %>% select(hrate) %>% filter(ddata, news_risk==3)` will fail. This is because you selected _just_  `hrate` and then asked for a filter on `news_risk` which no longer exists (since you _only_ selected `hrate`). 

Next, you can pass the data you wrangle to almost any other function in R.

~~~ R
# Summarise
ddata %>% filter(is.na(Age) == FALSE, Age >= 65) %>% select(Gender)summary

# Count missing
ddata %>% ddata %>% filter(Age >= 65) %>% select(Gender) %>% is.na %>% sum
~~~

There are a small number of 'verbs' in the dplyr package that allow you to very simply perform a large number of useful functions. In addition to `select`, and `filter`, you will want to learn:

1. `group_by`
2. `summarise`

Combining these two is super useful.

~~~ R
# But no means reported? This is because mean() doesn't report if there is missing data.
ddata %>% group_by(Gender) %>% summarise(Age.avg = mean(Age))

# A base R way of fixing this
ddata %>% group_by(Gender) %>% summarise(Age.avg = mean(Age, na.rm=TRUE))

# A dplyr fix
ddata %>% filter(is.na(Age)==FALSE) %>%  group_by(Gender) %>% summarise(Age.avg = mean(Age))
~~~

Both fixes work, but I would argue that last one is easier to read.

<!--
~~~ R
library(ggplot2)
ddata %>% group_by(news_risk) %>% select(hrate) %>%  plot(ddata$hrate)
~~~
 -->
<!-- - [ ] TODO(2016-06-02): add in exercises -->

<a name="base-r"></a>

### Wrangling the 'base' R way

The same can be done in 'base' R, without `dplyr`; this way was the way people wrangled data until January 2014 (the release date of `dplyr`). Many tutorials and resources on the internet might use this method so it's important to know it's existance and how it relates to the `dplyr` way.

Your data should already be available in the `ddata` object - if not, please load it as per the previous tutorial.

Similarly to the `dplyr` method, what if we wanted to look at the Gender of patients aged >= 65?

~~~ R

summary(ddata[ddata$Age >= 65,]$Gender)

~~~

So this is starting to look ugly! You 'll remember parts of this from the [first lesson](00-lesson-00-intro.html) where we introduced the idea of vectors. And that to 'R' everything is a vector. To work with 'bits' of data, we therefore need to specify the 'address' of the data.

We want to summarise the Gender of the patients who are Aged >= 65, we type `summary(ddata[ddata$Age >= 65,]$Gender)`. Let's break this down. I'll focus on one bit at a time, and use `...` to indicate the missing pieces.

- `summary( ... )` 
 
You should have met the summary function already. OK so far?

If we wanted to summarise heart rate for the whole data frame we'd write `summary(ddata$Gender)`. 

But we don't. So instead we want to pick just those patients whose Age is more or equal to 65

- ` ... Age >= 65 ...` 

Can you see this in the middle of the line of code? We are writing a comparison test that says is `Age` greater of equal to `65`. We use `==` not `=` when comparing otherwise R thinks you are _telling_ it that Age _is_ 3.


 So we want to run this comparison on the data frame `ddata`.

- `... ddata[ddata$Age >= 65,] ...`

This is called subsetting. We take `ddata` and ask for some portion of it. Because `ddata` is a data frame (square table) then it has rows and columns. We choose rows and columns by specifyin `[row,column]`. So ...

`ddata[3,1]` is the top left cell (row 3, column 1) of the third row of data
`ddata[3, ]` is all of the third row
`ddata[ ,1]` is all of the first column

Now try 

~~~ R
ddata$Age
~~~

We get the Age for every row.

Next try

~~~ R
ddata$Age >= 65
~~~

We get a list of True/False responses based on our test.

So `... ddata[ddata$Age >= 65,] ...` is simply wrapping the test inside the row selector. Notice the `,` after the test. That is telling R we want the test applied row-wise when selecting- which makes sense since the test is applied once per row for the column.

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

<a name="stringr"></a>

#### Wrangling strings

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

<a name="lubridate"></a>

#### Wrangling dates

#### Recipe 4: Parsing dates

We mentioned before how tricky dates can be. This time, a package to make that a little easier called [lubridate](). First, have a look at 

~~~ R
# Look at the raw data
bb.raw$recruit
str(bb.raw$recruit)
~~~

Looks like a bunch of dates stored as text? It would be nice to work with this. We need to convert these.

~~~ R
# install.packages("lubridate")  # if you haven't already
library(lubridate)
dmy(bb.raw$recruit)
~~~

So `dmy()` stands for _day_, _month_, _year_. There are similar convenience functions for all sorts of other orderings.

~~~ R
mdy("Jan 30 1974")
ymd("1974-1-30")
ymd_hm("1974-1-30 15:56")
ymd_hm("1974-1-30 3:56pm")
~~~

<!-- - [ ] TODO(2016-06-02): show how numerical dates allow you to plot, do differences etc -->

<a name="tidyr"></a>

#### Columns to rows and back again

A common problem with data is that it is arranged in a 'wide' form rather than in separate rows. Here for example, we might want to consider the pain scores over time, but these data are stored in separate columns. If you like, we are changing our unit of analysis from the _patient_ to the _pain assessment_.

~~~ R
library(tidyr)
str(bb.raw)
bb.long <- bb.raw %>% gather("time_string", "pain", ps0h:ps168h) 
names(bb.long)
View(bb.long)
~~~

Now let's extract those 'times' from the column we have made (called 'time_string').

~~~ R
bb.long %>% mutate(time = extract_numeric(time_string))
bb.long <- bb.long %>% mutate(time = extract_numeric(time_string))
~~~

What's the point? Well now we can look at the evolution of pain over time.

~~~ R
library(ggplot2)
str(bb.long)
ggplot(data=bb.long, aes(x=time, y=pain))  + geom_line() + facet_wrap(~id)
~~~

Now some work for you!

## Exercises

<!-- - gather (wide to long)
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

 -->


### Questions

1. Can you load the outreach data.

2. Do you think there is any age bias for ICU admissions?

### Answers

1. Load the outreach data.

~~~ R
ccot.raw <- read.csv("https://ndownloader.figshare.com/files/5094199?private_link=aff8f0912c76840c7526", stringsAsFactors=FALSE)
str(ccot.raw)
~~~

2. Do you think there is any age bias for ICU admissions?

~~~ R
ccot.working <- ccot.raw %>% mutate(age_cat = ntile(age, 10))
str(ccot.working)
ccot.working %>% group_by(age_cat) %>% summarise(icu_admit.avg = mean(icu_admit, na.rm=TRUE))
ggplot(data=ccot.working, aes(x=age, y=icu_admit)) + geom_smooth()
~~~

---

[Previous topic]() --- [Next topic]()


