---
layout: lesson
root: .
title: Just enough statistics
minutes: 25
---

<!-- rename file with the lesson name replacing template -->

## Learning Objectives 

    - Introduction to descriptive statistics
        - Start by plotting histograms of several variables in the clean data
        - Leads into distributions
            - Just talk about normal and non-normal
        - Keeping in mind previous material on sorts of variables...
        - Means, modes, medians
        - 


## Lesson 

### Introduction to descriptive statistics

A quick reminder of what normal distributions looks like.

![Several normal distributions](https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Normal_Distribution_PDF.svg/2000px-Normal_Distribution_PDF.svg.png)

We can see how the centre-point of the bell curve shifts right and left as the mean of the distribution changes, and how the thin-ness or fatness of the distribution alters as we change the standard deviation. Keep these shapes in mind as we inspect our data.

Let's start by plotting histograms of several variables from our data.
    
```
hist(data$ps12)
hist(data$age)
```

None of these data are normally distributed! Age comes the closest, but note that it is skewed toward higher ages with a long 'tail'. Let's pretend for a second that the age data were normal:
    
```
data$fake_age <- rnorm(nrow(data), mean = 50, sd = 2))  
hist(data$fake_age)
```


### Descriptive statistics

Recall:

- Mean = sum of all datapoints/number of datapoints
- Median = middle datapoint, if all data were arranged in order on a line
- Mode = most common datapoint

![Mean, median, mode](https://commons.wikimedia.org/wiki/File:Comparison_mean_median_mode.svg#/media/File:Comparison_mean_median_mode.svg)


## Exercises

### Questions

### Answers



---

[Previous topic]() --- [Next topic]()


