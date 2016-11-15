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

- Start by plotting histograms of several variables in the clean data
    - ps12 is very skewed (as are other pain scores)
    - age is similarly skewed
    
```
hist(data$ps12)
hist(data$age)
```

- The exemplar data doesn't have a good example of a normal distribution
    - We can simulate some data 
    
```
data$fake_age <- rnorm(nrow(data), mean = 50, sd = 2))  
hist(data$fake_age)
```
### Descriptive statistics
- Keeping in mind previous material on sorts of variables...
- Means, modes, medians

## Exercises

### Questions

### Answers



---

[Previous topic]() --- [Next topic]()


