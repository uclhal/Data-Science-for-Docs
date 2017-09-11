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

<!-- * Data Analysis Practical Worksheet - (v1) Danny

- [ ] Decide on the structure for analysis
- [ ] Create a example analysis for the Outreach dataset

 -->

## Worked Example

This is a worked example of the previous Data Analysis Worksheet lesson using the `outreach.csv` dataset

- [SPOTlight study data]({{page.dataurl_1 %}}): an observational study of deteriorating ward patients referred to critical care

<a name="load"></a>

### Step 1: Load in your own data

As the data is provided in the form of a `.csv` file, use `read.csv()` and assign it to object name `outreach`.


{% highlight r %}
outreach <- read.csv("data/outreach.csv")
{% endhighlight %}

<a name="examine"></a>

### Step 2: Examine your data in general

You want some idea of what your data looks like, so you can have a feel of what you have to play with. Try answering the following questions about your own dataset to make sure you understand it:

- Did the dataset load correctly into R? Remember sometimes there are weird column names
- Do you have a lot of empty cells that got loaded at the bottom of the dataframe which are actually useless?
- Do you know how many observations your dataset has or should have?
- What variables do you have in your dataset?


{% highlight r %}
View(outreach)
head(outreach)
{% endhighlight %}



{% highlight text %}
##   hospital patient dead28 icu_accept icu_admit time2icu early4 age male
## 1        1    2750      1          0         0       NA      0  70    1
## 2        1    2297      1          1         1        1      1  79    0
## 3        1    3782      0          1         1        1      1  51    1
## 4        1    2337      0          0         1       10      0  73    0
## 5        1    1020      0          0         0       NA      0  78    1
## 6        1    4852      0          0         0       NA      0  89    0
##    wday news_score news_risk sofa_score hrate bpsys temperature rrate
## 1  Tues          3         1          7    62    93          NA    16
## 2  Tues         10         3          2   130   134        36.0    40
## 3   Fri          7         3          3   100   120        37.9    26
## 4  Tues          4         2          1    90    80        37.2    15
## 5  Tues          3         1          4    81    97        36.9    NA
## 6 Thurs          6         2          2    80   134        36.1    30
##   pf_ratio creatinine platelets avpu lactate
## 1      356        427       114    0     0.6
## 2      206         80       357   NA     1.9
## 3       NA         82       210    0      NA
## 4       NA        105       283    0      NA
## 5       NA        174       344    0      NA
## 6      163         NA        NA    1     1.5
{% endhighlight %}



{% highlight r %}
tail(outreach)
{% endhighlight %}



{% highlight text %}
##       hospital patient dead28 icu_accept icu_admit time2icu early4 age
## 15153       48    5159      0          0         0       NA      0  53
## 15154       48    7657      0          0         0       NA      0  79
## 15155       48   12181      0          1         1        5      0  77
## 15156       48   12121      1          0         0       NA      0  79
## 15157       48    4019      0          0         0       NA      0  65
## 15158       48   14895      0          0         0       NA      0  55
##       male  wday news_score news_risk sofa_score hrate bpsys temperature
## 15153    0   Mon          8         3          2   110    90        39.5
## 15154    0  Tues          6         2          2    72    98        36.6
## 15155    1 Thurs          7         3          3   106   115        36.0
## 15156    0  Tues          6         1          4    80   198        37.4
## 15157    1  Tues          8         3          7    95    95        37.0
## 15158    0   Wed          6         2          1   125   115        37.2
##       rrate pf_ratio creatinine platelets avpu lactate
## 15153    22       NA         89        NA    2      NA
## 15154    22       NA         NA        NA    0      NA
## 15155    28       NA        140       350    0      NA
## 15156    22       NA         68       198    5      NA
## 15157    28       NA        533       247    0      NA
## 15158    22      329         67       282    0     2.5
{% endhighlight %}



{% highlight r %}
summary(outreach)
{% endhighlight %}



{% highlight text %}
##     hospital        patient          dead28         icu_accept    
##  Min.   : 1.00   Min.   :    1   Min.   :0.0000   Min.   :0.0000  
##  1st Qu.: 9.00   1st Qu.: 3790   1st Qu.:0.0000   1st Qu.:0.0000  
##  Median :23.00   Median : 7580   Median :0.0000   Median :0.0000  
##  Mean   :22.42   Mean   : 7580   Mean   :0.2824   Mean   :0.2339  
##  3rd Qu.:34.00   3rd Qu.:11369   3rd Qu.:1.0000   3rd Qu.:0.0000  
##  Max.   :48.00   Max.   :15158   Max.   :1.0000   Max.   :1.0000  
##                                                                   
##    icu_admit         time2icu          early4            age        
##  Min.   :0.0000   Min.   :  0.00   Min.   :0.0000   Min.   : 18.00  
##  1st Qu.:0.0000   1st Qu.:  1.00   1st Qu.:0.0000   1st Qu.: 57.00  
##  Median :0.0000   Median :  3.00   Median :0.0000   Median : 70.00  
##  Mean   :0.3345   Mean   : 11.86   Mean   :0.1711   Mean   : 66.84  
##  3rd Qu.:1.0000   3rd Qu.: 10.00   3rd Qu.:0.0000   3rd Qu.: 81.00  
##  Max.   :1.0000   Max.   :167.00   Max.   :1.0000   Max.   :104.00  
##                   NA's   :10087                                     
##       male           wday        news_score       news_risk    
##  Min.   :0.0000   Fri  :2298   Min.   : 0.000   Min.   :0.000  
##  1st Qu.:0.0000   Mon  :2203   1st Qu.: 4.000   1st Qu.:1.000  
##  Median :1.0000   Sat  :1900   Median : 6.000   Median :2.000  
##  Mean   :0.5186   Sun  :1874   Mean   : 6.395   Mean   :2.147  
##  3rd Qu.:1.0000   Thurs:2302   3rd Qu.: 9.000   3rd Qu.:3.000  
##  Max.   :1.0000   Tues :2345   Max.   :20.000   Max.   :3.000  
##                   Wed  :2236                                   
##    sofa_score         hrate           bpsys        temperature   
##  Min.   : 0.000   Min.   : 10.0   Min.   : 38.0   Min.   :33.00  
##  1st Qu.: 2.000   1st Qu.: 83.0   1st Qu.: 99.0   1st Qu.:36.20  
##  Median : 3.000   Median :100.0   Median :118.0   Median :36.80  
##  Mean   : 3.212   Mean   :100.2   Mean   :119.8   Mean   :36.85  
##  3rd Qu.: 4.000   3rd Qu.:116.0   3rd Qu.:138.0   3rd Qu.:37.30  
##  Max.   :14.000   Max.   :223.0   Max.   :294.0   Max.   :42.30  
##                   NA's   :246     NA's   :384     NA's   :1467   
##      rrate           pf_ratio      creatinine     platelets     
##  Min.   :  0.00   Min.   :   0   Min.   :   4   Min.   :   0.0  
##  1st Qu.: 18.00   1st Qu.: 136   1st Qu.:  69   1st Qu.: 165.0  
##  Median : 22.00   Median : 232   Median :  96   Median : 236.0  
##  Mean   : 23.61   Mean   : 268   Mean   : 147   Mean   : 257.4  
##  3rd Qu.: 28.00   3rd Qu.: 342   3rd Qu.: 159   3rd Qu.: 323.0  
##  Max.   :118.00   Max.   :5935   Max.   :3071   Max.   :1265.0  
##  NA's   :419      NA's   :9505   NA's   :2160   NA's   :2429    
##       avpu           lactate      
##  Min.   :0.0000   Min.   : 0.000  
##  1st Qu.:0.0000   1st Qu.: 1.100  
##  Median :0.0000   Median : 1.700  
##  Mean   :0.6656   Mean   : 2.607  
##  3rd Qu.:1.0000   3rd Qu.: 3.100  
##  Max.   :5.0000   Max.   :31.000  
##  NA's   :1394     NA's   :11016
{% endhighlight %}



{% highlight r %}
nrow(outreach)
{% endhighlight %}



{% highlight text %}
## [1] 15158
{% endhighlight %}



{% highlight r %}
str(outreach)
{% endhighlight %}



{% highlight text %}
## 'data.frame':	15158 obs. of  22 variables:
##  $ hospital   : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ patient    : int  2750 2297 3782 2337 1020 4852 1705 1579 7981 8828 ...
##  $ dead28     : int  1 1 0 0 0 0 0 0 0 0 ...
##  $ icu_accept : int  0 1 1 0 0 0 1 0 1 0 ...
##  $ icu_admit  : int  0 1 1 1 0 0 1 0 1 0 ...
##  $ time2icu   : int  NA 1 1 10 NA NA 0 NA 1 NA ...
##  $ early4     : int  0 1 1 0 0 0 1 0 1 0 ...
##  $ age        : int  70 79 51 73 78 89 27 69 54 54 ...
##  $ male       : int  1 0 1 0 1 0 0 0 1 0 ...
##  $ wday       : Factor w/ 7 levels "Fri","Mon","Sat",..: 6 6 1 6 6 5 6 5 7 5 ...
##  $ news_score : int  3 10 7 4 3 6 8 5 0 5 ...
##  $ news_risk  : int  1 3 3 2 1 2 3 2 0 2 ...
##  $ sofa_score : int  7 2 3 1 4 2 3 2 0 2 ...
##  $ hrate      : int  62 130 100 90 81 80 111 102 56 73 ...
##  $ bpsys      : int  93 134 120 80 97 134 101 86 126 97 ...
##  $ temperature: num  NA 36 37.9 37.2 36.9 36.1 37.6 36.3 37 35.7 ...
##  $ rrate      : int  16 40 26 15 NA 30 20 17 18 16 ...
##  $ pf_ratio   : int  356 206 NA NA NA 163 270 NA NA NA ...
##  $ creatinine : int  427 80 82 105 174 NA 38 64 78 54 ...
##  $ platelets  : int  114 357 210 283 344 NA 133 248 366 407 ...
##  $ avpu       : int  0 NA 0 0 0 1 NA 0 0 0 ...
##  $ lactate    : num  0.6 1.9 NA NA NA 1.5 1.7 NA NA NA ...
{% endhighlight %}

```
# Try using this function from the Hmisc package
# You might need to first install the package, we won't run this here
# install.packages("Hmisc")
library(Hmisc)
describe(outreach)
```
<a name="exploration"></a>

### Step 3: Explore individual variables

Now that you have had a general look at the data overall, try to zoom in on particular variables of interest. At this point you might start to have questions of the data that might start forming in your mind:

- Pick a few variables.
- What data types are these? E.g. integer/numeric, text strings, categorical/factors, binary? Are they correctly listed or do they need changing? You may have already taken note of this in the previous step.
- Assess the distribution of the data variables, are they normally distributed or skewed? Are there any visible outliers?
- For categorical variables, do you have any idea what the frequencies/proportions are for each category?
- Are there a significant number of missing recordings in your variables?


{% highlight r %}
# For large dataframes with many columns, it may sometimes be useful to pick out a few of the variables you are interested in using select from the dplyr package
library(dplyr)
restricted.outreach <- outreach %>% select(age, male, wday, lactate, sofa_score, news_score, news_risk, hrate, bpsys, rrate, creatinine, icu_accept, dead28)

# Alternatively you could use base R
restricted.outreach <- outreach[ , c("age", "male", "wday", "lactate", "sofa_score", "news_score", "news_risk", "hrate", "bpsys", "rrate", "creatinine", "avpu", "icu_accept", "dead28")]

# Now look through each variable, if you haven't already, try:
str(restricted.outreach)
{% endhighlight %}



{% highlight text %}
## 'data.frame':	15158 obs. of  14 variables:
##  $ age       : int  70 79 51 73 78 89 27 69 54 54 ...
##  $ male      : int  1 0 1 0 1 0 0 0 1 0 ...
##  $ wday      : Factor w/ 7 levels "Fri","Mon","Sat",..: 6 6 1 6 6 5 6 5 7 5 ...
##  $ lactate   : num  0.6 1.9 NA NA NA 1.5 1.7 NA NA NA ...
##  $ sofa_score: int  7 2 3 1 4 2 3 2 0 2 ...
##  $ news_score: int  3 10 7 4 3 6 8 5 0 5 ...
##  $ news_risk : int  1 3 3 2 1 2 3 2 0 2 ...
##  $ hrate     : int  62 130 100 90 81 80 111 102 56 73 ...
##  $ bpsys     : int  93 134 120 80 97 134 101 86 126 97 ...
##  $ rrate     : int  16 40 26 15 NA 30 20 17 18 16 ...
##  $ creatinine: int  427 80 82 105 174 NA 38 64 78 54 ...
##  $ avpu      : int  0 NA 0 0 0 1 NA 0 0 0 ...
##  $ icu_accept: int  0 1 1 0 0 0 1 0 1 0 ...
##  $ dead28    : int  1 1 0 0 0 0 0 0 0 0 ...
{% endhighlight %}



{% highlight r %}
# Plot some histograms
hist(restricted.outreach$age)
{% endhighlight %}

![center](/img/08-lesson-08-data-analysis-worked-example/unnamed-chunk-3-1.png)

{% highlight r %}
# Or the ggplot2 way
library(ggplot2)
ggplot(restricted.outreach, aes(age)) + geom_histogram()
{% endhighlight %}



{% highlight text %}
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
{% endhighlight %}

![center](/img/08-lesson-08-data-analysis-worked-example/unnamed-chunk-3-2.png)

{% highlight r %}
# Categorical variables can be viewed using tables
table(restricted.outreach$wday) # gives absolute counts
{% endhighlight %}



{% highlight text %}
## 
##   Fri   Mon   Sat   Sun Thurs  Tues   Wed 
##  2298  2203  1900  1874  2302  2345  2236
{% endhighlight %}



{% highlight r %}
table.name <- table(restricted.outreach$wday)
prop.table(table.name) # gives proportions
{% endhighlight %}



{% highlight text %}
## 
##       Fri       Mon       Sat       Sun     Thurs      Tues       Wed 
## 0.1516031 0.1453358 0.1253464 0.1236311 0.1518670 0.1547038 0.1475129
{% endhighlight %}



{% highlight r %}
# Use the is.na() function for looking at missingness
table(is.na(outreach$lactate))
{% endhighlight %}



{% highlight text %}
## 
## FALSE  TRUE 
##  4142 11016
{% endhighlight %}

<a name="hypotheses"></a>

### Step 4: Think of some questions/hypotheses

Now we are getting into perhaps the most interesting part of the exercise. Can you think of any questions you might want to answer with your dataset?

If you brought your own data, you might already have a good idea about the sorts of questions you want answers to. If not, and you are using the outreach dataset we provided, try answering some of the following questions:

- Are men or women more likely to be accepted onto ICU?
- Is mortality associated with SOFA score?
- Is mortality associated with lactate?
- Is there an association between age and ICU admission rates?
- Does creatinine rise with age?

<a name="bivariate"></a>

### Step 5: Do some bivariate plots

If you are assessing the influence of one variable on another, it is good to see if you can visualise this in a bivariate plot. In other words, 2 variables on the same plot. This may take the form of a scatter plot (when both variables are continuous), or boxplot (y-axis continuous, x-axis categorical). 

{% highlight r %}
# You can do it in base R, a boxplot or a scatterplot would automatically be selected
plot(creatinine ~ age, data = outreach)
{% endhighlight %}

![center](/img/08-lesson-08-data-analysis-worked-example/unnamed-chunk-4-1.png)

{% highlight r %}
boxplot(outreach$lactate ~ outreach$avpu) 
{% endhighlight %}

![center](/img/08-lesson-08-data-analysis-worked-example/unnamed-chunk-4-2.png)

{% highlight r %}
# Alternatively using ggplot2
library(ggplot2)
ggplot(outreach, aes(y = creatinine, x = age)) + geom_point()
{% endhighlight %}



{% highlight text %}
## Warning: Removed 2160 rows containing missing values (geom_point).
{% endhighlight %}

![center](/img/08-lesson-08-data-analysis-worked-example/unnamed-chunk-4-3.png)

{% highlight r %}
ggplot(outreach, aes(y = lactate, x = factor(avpu))) + geom_boxplot() # For a boxplot
{% endhighlight %}



{% highlight text %}
## Warning: Removed 11016 rows containing non-finite values (stat_boxplot).
{% endhighlight %}

![center](/img/08-lesson-08-data-analysis-worked-example/unnamed-chunk-4-4.png)

It's important to remember that for boxplots, the whiskers represent the largest and smallest values no further than 1.5 * IQR.

<a name="model"></a>

### Step 6: Think of constructing a model

A statistical model is really just a mathematical representation of the dataset. It can be a way of describing how the variables relate to each other or describe how the variables are distributed.

Statistical modelling is probably beyond the scope of our lessons, but a good primer on the topic by Hadley Wickham, creator of `dplyr` and `ggplot2`, can be found [here](http://r4ds.had.co.nz/model-intro.html).

Here we will just show one example of a very simple linear model:


{% highlight r %}
linear.model <- lm(formula = creatinine ~ age, data = outreach)
summary(linear.model)
{% endhighlight %}



{% highlight text %}
## 
## Call:
## lm(formula = creatinine ~ age, data = outreach)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -158.46  -75.64  -47.50    7.93 2918.88 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 82.29324    5.18165   15.88   <2e-16 ***
## age          0.96985    0.07511   12.91   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 151.1 on 12996 degrees of freedom
##   (2160 observations deleted due to missingness)
## Multiple R-squared:  0.01267,	Adjusted R-squared:  0.01259 
## F-statistic: 166.7 on 1 and 12996 DF,  p-value: < 2.2e-16
{% endhighlight %}



{% highlight r %}
plot(creatinine ~ age, data = outreach)
abline(linear.model)
{% endhighlight %}

![center](/img/08-lesson-08-data-analysis-worked-example/unnamed-chunk-5-1.png)

{% highlight r %}
# And in ggplot2
ggplot(subset(outreach, !is.na(creatinine)), aes(y = creatinine, x = age)) +
  geom_point() + 
  geom_line(aes(y = predict(linear.model, type = "response")))
{% endhighlight %}

![center](/img/08-lesson-08-data-analysis-worked-example/unnamed-chunk-5-2.png)

However, a statistical model doesn't have to be very complicated. A significance test (e.g. a t-test) can tell us something about the dataset to help explain it. 


{% highlight r %}
t.test(subset(outreach, male == 1)$age, subset(outreach, male == 0)$age)
{% endhighlight %}



{% highlight text %}
## 
## 	Welch Two Sample t-test
## 
## data:  subset(outreach, male == 1)$age and subset(outreach, male == 0)$age
## t = 0.51662, df = 14613, p-value = 0.6054
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.4172435  0.7159014
## sample estimates:
## mean of x mean of y 
##  66.91019  66.76086
{% endhighlight %}



{% highlight r %}
chisq.test(outreach$male, outreach$icu_accept, correct = FALSE)
{% endhighlight %}



{% highlight text %}
## 
## 	Pearson's Chi-squared test
## 
## data:  outreach$male and outreach$icu_accept
## X-squared = 13.037, df = 1, p-value = 0.0003053
{% endhighlight %}



{% highlight r %}
# Many ways to skin a cat
table_male_accept <- table(outreach$male, outreach$icu_accept) 
summary(table_male_accept)
{% endhighlight %}



{% highlight text %}
## Number of cases in table: 15158 
## Number of factors: 2 
## Test for independence of all factors:
## 	Chisq = 13.037, df = 1, p-value = 0.0003053
{% endhighlight %}

---

[Previous topic](08-lesson-08-data-analysis-worksheet.html) 
