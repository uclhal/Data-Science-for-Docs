% Just enough statistics
% Finn Catling

---------

# Before we start...

```
rct_data <- read_csv("https://raw.githubusercontent.com/datascibc/Data-Science-for-Docs/master/data/breast-rct-clean-fakeage.csv")
```

---------

# The big picture

Our RCT attempts to answer a research question by collecting data from a *sample* of a *population*.

---------

Data collection consists in measuring the values of several *variables* for each member of the population.

---------

## Descriptive statistics

- Inspect the data
- Organise the data
- Summarise the data

---------

## Inferential statistics

 - Draw conclusions about the population from the sample
 - Test the reliability of those conclusions

 ----------

## Variables

- Variables may be *continuous* or *discrete*
- Consider these:
	- **age**
	- **random**, **satisfaction**

----------

## Distributions

```
qplot(rct_data$age, binwidth=8)
qplot(rct_data$id, geom="bar")
qplot(rct_data$ps12, geom="bar")
qplot(rct_data$binary_satisfaction, geom="bar")
```

----------

![](http://www.statisticshowto.com/wp-content/uploads/2014/12/gaussian-distribution-family.png)

Do our variables looks like this?

---------

## Means, medians and modes

- Mean: sum of all datapoints / number of datapoints
- Median: middle datapoint
- Mode: most common datapoint

----------

![Mean, median, mode](https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Comparison_mean_median_mode.svg/2000px-Comparison_mean_median_mode.svg.png)

-------

Have a go with these variables: **age**, **ps12**, **move24h**

You can use the functions `mean()` and `median()`, for example:

```
mean(rct_data$ps12, na.rm=TRUE)
median(rct_data$ps12, na.rm=TRUE)
```

---------

## Measuring 'spread'

- For normally-distibuted data, use standard deviation
- For non normally-distributed data, use interquartile range

```
IQR(rct_data$age, na.rm=TRUE)
sd(rct_data$age, na.rm=TRUE)
```

---------

## Calculate it all at once

```
summary(rct_data)
```

-----------

## Testing (here be dragons)

- best_option <- "**Ask a statistician**" 
- pragmatic_option <- "Do it yourself, **carefully** and **simply**"

---------------

## Think about

1. The hypothesis you want to test
2. Where your observations come from
3. The type of variables you are dealing with
4. The assumptions that different tests use
5. Interpreting the test results

----------

## Hypothesis 1

> 'Mean age differs between the two treatment arms'

> Recall: The treatment arms are 1) patients receiving local anaesthetic via drain, and 2) patients receiving local anaesthetic via injection to the skin flaps'

---------

## Hypothesis 1

> 'Mean age differs between the two treatment arms'

- What sort of variables are these?
- What is the *independent variable*?
- What is the *dependent variable*?
- What is the *null hypothesis*?
- **Which test should we use?**

---------

## Unpaired 2-tail t test: Assumptions

- Values within each group are independent
- The two groups are independent of one another
- (Values in each group should be approximately normally-distributed)

---------

## Let's look at our data...

```
p <- ggplot(rct_data, aes(x=fake_age, group=random, fill=random))
p <- p + geom_histogram(position="identity", alpha=0.5, binwidth=6)
p <- p + theme_bw()
p
```

Note that the 'spread' of the groups is different - a problem for the standard t test, but R takes care of this for us behind the scenes.

---------

## Let's run the test!

```
t.test(rct_data$fake_age~rct_data$random)
```

---------

## Hypothesis 2

> 'Patient satisfaction after axillary node dissection depends on treatment arm.'

----------

## Hypothesis 2

> 'Patient satisfaction after axillary node dissection depends on treatment arm.'

- What sort of variables are these?
- What is the *independent variable*?
- What is the *dependent variable*?
- What is the *null hypothesis*?
- **Which test should we use?**

----------

## Chi-squared test for independence: Assumptions

- The two groups are independent of one another
- Count in each cell of the table should be 5 or more

--------

## Let's look at our data

```
tbl = table(rct_data$random, rct_data$binary_satisfaction)
tbl
```

--------

## Let's run the test!

```
chisq.test(tbl)
```

--------

## Picking the right test

[UCLA Which test?](https://stats.idre.ucla.edu/other/mult-pkg/whatstat/)

----------

## A gentle (and pretty!) intro to probability/stats

[Seeing theory](http://students.brown.edu/seeing-theory/)

----------

## Questions
