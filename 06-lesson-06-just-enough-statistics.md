---
layout: lesson
root: .
title: Just enough statistics
minutes: 25
---


## Learning Objectives 

    - Introduction to descriptive statistics
        - Start by plotting histograms of several variables in the clean data
        - Leads into distributions
            - Just talk about normal and non-normal
        - Keeping in mind previous material on sorts of variables...
        - Means, modes, medians
        - 


## Lesson

### The big picture

A typical healthcare research project attempts to answer a research question by collecting data from a *sample* of a *population*.

Data collection consists in measuring the values of several *variables* for each member of the population.

First, we gain insight into the data we have collected by inspecting it, organising it, summarising it. This is *descriptive statistics*.

Then, we use the data to draw conclusions about the population from which the sample is collected, and to test the reliability of those conclusions. This is *inferential statistics*.



### Descriptive statistics









A quick reminder of what normal distributions looks like.

![Several normal distributions](https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Normal_Distribution_PDF.svg/2000px-Normal_Distribution_PDF.svg.png)

We can see how the centre-point of the bell curve shifts right and left as the mean of the distribution changes, and how the thin-ness or fatness of the distribution alters as we change the standard deviation. Keep these shapes in mind as we inspect our data.

Let's start by plotting histograms of several variables from our data.
    
```
hist(data$ps12)
hist(data$age)
```

None of these variables are normally distributed! Age comes the closest, but note that it is skewed toward higher ages with a long 'tail'. Let's pretend for a second that the age data were normal:
    
```
data$fake_age <- rnorm(nrow(data), mean = 50, sd = 2))  
hist(data$fake_age)
```


### Descriptive statistics

Recall:

- Mean = sum of all datapoints/number of datapoints
- Median = middle datapoint, if all data were arranged in order on a line
- Mode = most common datapoint

![Mean, median, mode](https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Comparison_mean_median_mode.svg/2000px-Comparison_mean_median_mode.svg.png)

Try calculating the mean and median for the following data columns: `age`, `ps12`, `move24h`

You can use the following functions: `mean()`, `median()`

For measuring the 'spread' of the data:

- For normally-distibuted data, use standard deviation
- for non normally-distributed data, use interquartile range, i.e if all data were arranged in order on a line, the range between 25% and 75% along this line

You can calculate lots of useful descriptive stats in one fell swoop using just one simple R function:

```
summary(data)
```


## Exercises

### Questions

### Answers



---

[Previous topic]() --- [Next topic]()


