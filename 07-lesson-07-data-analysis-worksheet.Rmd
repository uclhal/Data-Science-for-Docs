---
layout: lesson
author: "Danny Wong"
root: .
title: Data pipelines
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

<!-- * Data Analysis Practical Worksheet - (v1) Danny

- [ ] Decide on the structure for analysis
- [ ] Create a example analysis for the Outreach dataset

 -->

## Lesson 

This lesson will be a guided practical applying all the principles learned over the course.

You may have some of your own data that you would like to analyse, using this worksheet as a guide. Alternatively you can use the datasets we have been interacting with during the course.

- An [RCT]({{page.dataurl_2%}}) comparing post-operative pain control after axillary node dissection with local anaesthetic infiltration via the drain versus injection to the skin flaps (Thanks to Muska Khpal)
- [SPOTlight study data]({{page.dataurl_1 %}}): an observational study of deteriorating ward patients referred to critical care

<a name="load"></a>

### Step 1: Load in your own data

Depending on the form your data takes, use `read.csv()`, `read.table()` or `readxl::read_excel()` to bring your data in to `R`, and assign it to an object name.

```
# For example
dataframe.name <- read.csv("file/path.csv", ...)

# If using an .xlsx file
library(readxl)
dataframe.name <- read_excel("file/path.xlsx", ...)
```

<a name="examine"></a>

### Step 2: Examine your data in general

You want some idea of what your data looks like, so you can have a feel of what you have to play with. Try answering the following questions about your own dataset to make sure you understand it:

- Did the dataset load correctly into R? Remember sometimes there are weird column names
- Do you have a lot of empty cells that got loaded at the bottom of the dataframe which are actually useless?
- Do you know how many observations your dataset has or should have?
- What variables do you have in your dataset?

```
# Try using some of the following commands
View(dataframe.name)
head(dataframe.name)
tail(dataframe.name)
summary(dataframe.name)
nrow(dataframe.name)
str(dataframe.name)
names(iris)

# Try using this function from the Hmisc package
# You might need to first install the package
# install.packages("Hmisc")
library(Hmisc)
describe(dataframe.name)
```
<a name="exploration"></a>

### Step 3: Explore individual variables

Now that you have had a general look at the data overall, try to zoom in on particular variables of interest. At this point you might start to have questions of the data that might start forming in your mind:

- Pick a few variables.
- What data types are these? E.g. integer/numeric, text strings, categorical/factors, binary? Are they correctly listed or do they need changing? You may have already taken note of this in the previous step.
- Assess the distribution of the data variables, are they normally distributed or skewed? Are there any visible outliers?
- For categorical variables, do you have any idea what the frequencies/proportions are for each category?
- Are there a significant number of missing recordings in your variables?

```
# For large dataframes with many columns, it may sometimes be useful to pick out a few of the variables you are interested in using select from the dplyr package
library(dplyr)
restricted.dataframe.name <- dataframe.name %>% select(variable1, variable2, variable3, ...)

# Alternatively you could use base R
restricted.dataframe.name <- dataframe.name[ , c("variable1", "variable2", "variable3", ...)]

# Now look through each variable, if you haven't already, try:
str(restricted.dataframe.name)

# Plot some histograms
hist(restricted.dataframe.name$variable1)

# Or the ggplot2 way
library(ggplot2)
ggplot(restricted.dataframe.name, aes(variable1)) + geom_histogram()

# Categorical variables can be viewed using tables
table(restricted.dataframe.name$categorical.variable) # gives absolute counts
table.name <- table(restricted.dataframe.name$categorical.variable)
prop.table(table.name) # gives proportions

# Use the is.na() function for looking at missingness
table(is.na(dataframe.name$variable2))
```

<a name="hypotheses"></a>

### Step 4: Think of some questions/hypotheses

Now we are getting into perhaps the most interesting part of the exercise. Can you think of any questions you might want to answer with your dataset?

If you brought your own data, you might already have a good idea about the sorts of questions you want answers to. If not, and you are using the outreach dataset we provided, try answering some of the following questions:

- Are men or women more likely to be accepted onto ICU?
- Is mortality associated with SOFA score?
- Is mortality associated with lactate?
- Is there an association between age and ICU admission rates?

<a name="bivariate"></a>

### Step 5: Do some bivariate plots

If you are assessing the influence of one variable on another, it is good to see if you can visualise this in a bivariate plot. In other words, 2 variables on the same plot. This may take the form of a scatter plot (when both variables are continuous), or boxplot (y-axis continuous, x-axis categorical). 
```
# You can do it in base R, a boxplot or a scatterplot would automatically be selected
plot(variable1 ~ variable2, data = dataframe.name)
plot(dataframe.name$variable1 ~ dataframe.name$variable2) # There are a number of ways to write this

# Alternatively using ggplot2
library(ggplot2)
ggplot(dataframe.name, aes(y = variable1, x = variable2)) + geom_point()
ggplot(dataframe.name, aes(y = variable1, x = variable2)) + geom_boxplot() # For a boxplot
```

It's important to remember that for boxplots, the whiskers represent the largest and smallest values no further than 1.5 * IQR.

<a name="model"></a>

### Step 6: Think of constructing a model

A statistical model is really just a mathematical representation of the dataset. It can be a way of describing how the variables relate to each other or describe how the variables are distributed.

Statistical modelling is probably beyond the scope of our lessons, but a good primer on the topic by Hadley Wickham, creator of `dplyr` and `ggplot2`, can be found [here](http://r4ds.had.co.nz/model-intro.html).

Here we will just show one example of a very simple linear model:

```
linear.model <- lm(formula = variable1 ~ variable2, data = dataframe.name)
summary(linear.model)

plot(variable1 ~ variable2, data = dataframe.name)
abline(linear.model)

# And in ggplot2
ggplot(dataframe.name, aes(y = variable1, x = variable2)) +
  geom_point() + 
  geom_line(aes(y = predict(linear.model, type = "response")))
```

However, a statistical model doesn't have to be very complicated. A significance test (e.g. a t-test) can tell us something about the dataset to help explain it. 

```
t.test(variable1, variable2)
```

If you used the `outreach.csv` dataset that we provided to work through your analyses, click on the Worked Example link below to see our suggested answers.

---

[Previous topic](06-lesson-06-dataviz.html) --- [Worked Example](08-lesson-08-data-analysis-worked-example.html)

