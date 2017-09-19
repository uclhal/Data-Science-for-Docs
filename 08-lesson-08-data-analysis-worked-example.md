---
layout: lesson
author: "Danny Wong"
root: .
title: Data Analysis Practical (Worked Examples)
minutes: 25
---

<!-- rename file with the lesson name replacing template -->

## Learning Objectives

1. [Load in your own data](#load)
2. [Examine your data in general](#examine)
3. [Explore individual variables](#exploration)
4. [Think of some questions/hypotheses](#hypotheses)
5. [Do some bivariate plots](#bivariate)
6. [Think of constructing a model](#model)

## Worked Example

SPOTlight was a prospective cohort study of deteriorating ward patients assessed for critical care admission in National Health Service hospitals in the UK. Early admission was defined as within 4 h of assessment. The primary endpoint was 90-day survival. We have provided you with a copy of some key variables from the original study.

## Questions

- How long did it take from ward assessment to ICU admission?
- Does age affect the chances of your being offered a critical care bed? Is this true after adjusting for severity?
- How well does NEWS score work compared to a richer score such as SOFA?
- Does lactate add information to the NEWS score? Should we measure it for sick ward patients?
- Is there an effect of ICU admission on outcome? What about prompt admission?

## Example script to get you started

~~~
# Steve Harris
# 2017-09-19
# Explore outreach data, and examine factors affecting admission to critical care

# Load up the libraries I will use
library(readr)
library(Hmisc)
library(ggplot2)
library(dplyr)

# Load directly from the internet share
df <- read_csv('https://ndownloader.figshare.com/files/5094199?private_link=aff8f0912c76840c7526')

# Basic overview of the data
str(df)
~~~

## Inspect your data

First of perform some sanity checks. Make sure you understand your data. How many rows (observations), and what variables? How are these variables encoded? Use the functions `nrow(df)`, `ncol(df)`, `names(df)`, `head(df)`.

There's a nice function called `describe()` in the library *Hmisc* (so named as 'Harrel'-'miscellaneous': all you need to know is that Frank Harrel is a famous(!) statistician from van der Bilt). You use it as follows `describe(df$my_variable)` to inspect a variable. It will summarise, report missingness, report unique values and more.

Can you work out what the unit of analysis is (i.e. what does a row represent)? Hospitals? Patients? Referrals?

## Pick a question

Let's try to understand if age affects your chances of admission? There are two relevant variables (in addition to `age`):

|   Variable   |                                  Description                                  |
|--------------|-------------------------------------------------------------------------------|
| `icu_admit`  | boolean (1/0) indicator of fact of admission to ICU within 1 week of referral |
| `icu_accept` | boolean (1/0) indicator of decision to admit to ICU within 1 week of referral |
| `news_score` | the integer NEWS score recorded on the ward at the time of assessment         |
| `news_risk`  | the (categorical) NEWS risk class at the time of assessment                   |

You should always start by trying to understand in detail these variables contributing to the question you're asking. It's probably also worth looking at the NEWS score variables as markers of severity.

This means you'll need to inspect a mixture of continuous (`age`, `news_score`), nominal (`icu_accept`, `icu_admit`), ordinal (`news_risk`) variables.

Try doing this both visually (see the exploratory data visualisation lecture), and numerically by using `table()`, and `describe()`.

Here's a starter looking at age:

~~~
describe(df$age)
ggplot(df, aes(x=age)) + geom_histogram(binwidth=1)
~~~

---

[Previous topic](08-lesson-08-data-analysis-worksheet.html)
