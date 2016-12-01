---
layout: lesson
root: .
title: Just enough statistics
minutes: 25
---

<!-- rename file with the lesson name replacing template -->

## Learning Objectives 

<!--     * Data viz - (v1) Finn (v2) Danny
        ?do dataviz before stats because we want to emphasise the importance of looking at your data; therefore just focus on histograms/bar and scatter plots
        - [ ] inspect before testing concept so dataviz of distribution before ttest etc
        - [ ] ggplot2
    * Stats - (v1) Sundiya (v2) 
        - [ ] choose your test diagram
        - [ ] simple tests
 -->    


## Lesson 

### The big picture

Our RCT attempts to answer a research question by collecting data from a *sample* of a *population*.

Data collection consists in measuring the values of several *variables* for each member of the population.

First, we gain insight into the data we have collected by inspecting it, organising it, summarising it. This is *descriptive statistics*.

Then, we use the data to draw conclusions about the population from which the sample is collected, and to test the reliability of those conclusions. This is *inferential statistics*.


### Descriptive statistics

#### Variables

Variables may be *continuous* or *discrete*.

Continuous variables can be measured with arbitrary precision. Think of the **age** variable in our dataset: we are measuring it to the nearest year, but in theory we could measure this in seconds, nanoseconds or even more accurately.

In contrast, Discrete variables take only a fixed number of possible values. Look at the **random** variable in our dataset which only takes the values 'drain' and 'skin', or the **satisfaction** variable that takes only the values 'Poor', 'Satisfactory'', Good' and 'Excellent'.

NB. The values of **random** don't seem to have any particular ordering, but the values for **satisfaction** do: 'Good' is higher than 'Satisfactory', and so on. We therefore call this an *ordinal* variable. However, are we sure that the distance between 'Poor' and 'Satisfactory' is the same as that between 'Good' and 'Excellent', etc? Maybe not. We should probably conclude, then, that the **satisfaction** variable isn't *interval*. It is worth thinking about these things because they affect the tests we can use later on.


#### Distributions

Let's think about the **age** variable in our data can take, and how often it takes each one. We can visualise this with a histogram:

```
# The 'breaks=20' part dictates how many 'bins' the histogram uses
hist(data$age, breaks = 20)
```

Our RCT dataset contains 64 rows of observations, but imagine if it contained 1 million rows, or even more. We would start to build up a detailed picture of how often different ages occur in our data. This would be the *distribution* of the age variable. Let's look at a few of the other variables.

```
hist(df$ps12)
hist(df$id, breaks = 20)
```

**ps12** could be described as right-tailed, or *right-skewed*. It might seem a bit irrelevant to plot a histogram for the **id** variable, but this is a great example of the *uniform distribution* (where all states of the variable are equally likely). There is another, very important distribution you will also have heard of:

![Several normal distributions](https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Normal_Distribution_PDF.svg/2000px-Normal_Distribution_PDF.svg.png)

We can see how the centre-point of the bell curve shifts right and left as the mean of the distribution changes, and how the thin-ness or fatness of the distribution alters as we change the standard deviation.

A key question to ask yourself as you inspect the histograms for your data is, does this variable approximate the normal distribution? That is, if we kept taking more-and-more observations in our experiment, would the histogram we obtain look more-and-more like a bell-curve? Again, this is important to think about because if affects the tests we can use later.

It actually turns out that none of the variables in our RCT are normally distributed (age comes the closest, but it is too left-skewed). Let's pretend for a second that the age data were normal:
    
```
data$fake_age <- rnorm(nrow(data), mean = 50, sd = 2))  
hist(data$fake_age)
```


#### Means, medians and modes

Recall:

- Mean = sum of all datapoints/number of datapoints
- Median = middle datapoint, if all data were arranged in order on a line
- Mode = most common datapoint

![Mean, median, mode](https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Comparison_mean_median_mode.svg/2000px-Comparison_mean_median_mode.svg.png)

Try calculating the mean and median for the following data columns: `age`, `ps12`, `move24h`

You can use the following functions: `mean()` and `median()`

For measuring the 'spread' of the data:

- For normally-distibuted data, use standard deviation
- for non normally-distributed data, use interquartile range, i.e if all data were arranged in order on a line, the range between 25% and 75% along this line

You can calculate lots of useful descriptive statistics in one fell swoop using just one simple R function:

```
summary(data)
```









[Which test?](http://www.bmj.com/about-bmj/resources-readers/publications/statistics-square-one/13-study-design-and-choosing-statisti)



## Exercises

### Questions

### Answers



---

[Previous topic](04-lesson-04-data-wrangling.html) --- [Next topic](06-lesson-06-dataviz.html)


