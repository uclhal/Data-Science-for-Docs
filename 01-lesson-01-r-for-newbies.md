---
layout: lesson
root: .
title: R for newbies
minutes: 25
---


## Learning Objectives 

- [Why R](#why-r)
- [Find your way around RStudio](#start-rstudio-and-have-a-look-around)  
- [R building blocks](#r-building-blocks)
- [Get your hands dirty](#follow-me)

## Lesson 

<a name="why-r"></a>

### Why R?

This is the long-story short version, but see [here](why-r.html) for more detail.

Why do people think R is hard? Because it's not a GUI (pronounced gooey!). No more point and click. You have to write stuff down. Sounds like a disadvantage? We want to convince you otherwise. 

Two good reasons:

- **Science should be reproducible**. You can't record point and clicks. But you can re-run your 'code'.
- **Long term gain from upfront investment**. If you have ever done a bunch of work preparing a table or a graph, and then discovered that either you have a new data point to add, or the next month's results are available then the GUI approach means starting all the pointing-and-clicking from scratch. But write it down once, re-run as often as you wish.

The underlying principle of what we want to show you is how to build a data pipeline. You start with your data in a spreadsheet. You write a bunch of instructions (a script) using the R language. Your script produces an output (a table or a figure). Run your script. Generate your output. Change your data. Run the _same_ script. Instantly re-generate your updated output. 

---

<a name="start-rstudio-and-have-a-look-around"></a>

### Start RStudio and have a look around

R (does the work) vs RStudio (helps you use R)

- R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS.
- RStudio is a set of integrated tools designed to help you be more productive with R. It includes a console, syntax-highlighting editor that supports direct code execution, as well as tools for plotting, history, debugging and workspace management.

![](img/r-studio-ide.png)

<!-- ![](img/r-studio-windows-vanilla.jpeg) -->

The screen should be divided in quadrants or panes. The two most important are labelled _Source_ (top left), and _Console_ (bottom left). On the right are supporting panes with tabs for finding help, and inspecting your files. If you can't see 4 panes then try clicking the 'minimise'/'maximise' icons in the top right corners.

There's a handy cheat sheet for R studio available [here](https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf). 

> **TRY THIS:** Find the files tab, navigate to the 'code' folder in your project, then click on the 'More' button and select 'Set as working directory'.

#### Console (bottom left)

The console _is_ R! Type anything here, and it will be interpreted by R.

Try typing `2+2`

     > 2+2
    [1] 4

There are 4 things to explain in the little code snippet above.

1. The command prompt "`>`" (or greater than sign to you and me) is simply R prompting you to enter some text
2. The expression `2+2` is the sum that we asked R to perform.
3. We'll come back to the `[1]` at the beginning of the next line in a moment.
4. R prints the answer `4`

Re-assuring as it is that R knows that `2+2=4`, you were probably hoping for a little more. Typing directly into R is a start, but we want to teach you _reproducible_ research. The scientific method requires that we document our work, but we can't reproduce your typing unless we record it somewhere. 

> **TIP:** Use the up and down arrow keys to go backwards and forwards in your 'command' history to quickly fix typos.

<a name="keep-a-lab-book-of-your-work"></a>

#### Source (top left)

The solution is to create a file, write your commmands in that file, and then tell R to work through the commands in that file. Switch to the pane labelled source, and this time type `2-2`. 

Now typing <enter> brings you to a new line. But go back to the line with `2-2` and hit <command-enter> (on Windows <control-enter>) instead. This sends the last line you wrote from the 'source' document, to the console. You should now see that R can add and substract!

    > 2+2
    [1] 4
    > 2-2
    [1] 0

Now save the file you have written as `labbook_YYMMDD.R` (replace YYMMDD with today's date e.g. `labbook_160103.R`). You must use the `.R` extension to indicate that this is an R script, but you can, of course, choose any name you wish.

The console is also called an _interactive_ R session. What you type here is gone when you close down R. The source pane is simply a view into a text file (with the `.R` extension) that allows you to document, edit, correct and _most importantly_ save your work. The next time you come back to R, you re-open the file, and replay your commands. Got it? Then you're now starting to follow the principles of reproducible research.

---

### R building blocks

I want to argue that there are only three building blocks within R.

- names
- data
- functions

#### Names

It's easier to give names to things, and then use the names rather than the thing itself most of the time. We use the `<- ` assignment operator to assign a name. 

> **TIP:** Use _option_ (Mac OS X) or _alternate_ (Windows) and the `-` (minus) key as a short cut to type this in RStudio.

Let `pi` equal `3.14`

    pi <- 3.14

Let `msg` equal `Hello World!`

    msg <- `Hello World!`

#### Data

We are about to use a bunch of very 'math-y' words. Please do not be put off!

R is a _statistical computing_ language, and statistics uses vectors and matrices. These are _not_(!) complicated things.

##### Vectors

In R, a vector is a list of things of the same type.

A list of numbers (a number vector):

    1, 4, 9, 16, 25

A list of characters (a character vector):

    "Q", "W", "E", "R", "T", "Y"

We _index_ the list by counting from left to right starting with `1` (not `0`). 

To make these vectors in R, we _combine_ the listed elements using `c()`.

    x <-  c("Q", "W", "E", "R", "T", "Y")
    

Now if you want the 3rd element, simply type `x[3]`.

    x <-  c("Q", "W", "E", "R", "T", "Y")
    x[3]
    [1] "E"

Because R _always_ 'thinks' in vectors, even the answer is 'indexed' hence the leading  `[1]`.

> **TRY THIS:** Try typing `1:100`. This is a shorthand way of writing all the numbers between 1 and 100. Look below, and see that the number in square brackes is just R keeping count of the numbers it shows you.

    R> 1:100
      [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23
     [24]  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46
     [47]  47  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69
     [70]  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90  91  92
     [93]  93  94  95  96  97  98  99 100


##### Matrices

Matrices are just 'strict' versions of your typical spreadsheet tables. Just like a vector, every item is indexed, and by convention the address is _row_ then _column_ (think _'arsey'_, _rc_, _row then column_).

Let's make a matrix.

    x <- matrix(1:12, nrow=3, ncol=4)

Note how we used `1:12` to make a vector of the numbers from `1` to `12` before asking for a 3 row and 4 column matrix. R fills in the matrix by filling each column before moving to the next row.

         [,1] [,2] [,3] [,4]
    [1,]    1    4    7   10
    [2,]    2    5    8   11
    [3,]    3    6    9   12

The address of the `8` is `[2,3]` (row 2, column 3).

##### Data frames

More useful to us are data frames which are just 'mixed' matrices. So if I have age, sex, and weight data in 3 vectors:

    age <- c(5,7,41,41)
    sex <- c("M", "M", "F", "M")
    weight <- c(16,30,55,78)

Then I can combine them into a _data frame_.

    demographics <- data.frame(age,sex,weight)

Have a look at `demographics`.

    R> demographics
      age sex weight
    1   5   M     16
    2   7   M     30
    3  41   F     55
    4  41   M     78

What's nice is that the `data.frame` _numbers_ the rows, and _names_ the columns.

Moreover, rather than having to use numerical addresses to look at data, you can use the `$` operator to access the columns by name.

> **TRY THIS:** Try typing `demographics$age`

#### Functions

Think of functions as litte machines. They perform tasks. To perform a task, they need an input, and the result of their work is the output. 

![](img/function-anatomy.png)

    R> say_hello("Steve")
    [1] "Hello Steve"

R comes with a bunch of functions pre-installed called. These are called 'base R'. However, there are thousands of additional functions packaged together into libraries that you will want to use too. You load these by calling (surprise, surprise) a base R function called `library`.

    library(ggplot2)

---

<a name="follow-me"></a>

### Get your hands dirty

Congratulations. That was the most 'conceptual' part of the course. Now time to get your hands dirty!

See if you can follow along.

Load a plotting library called `ggplot2` (The `gg` refers to a famous book by William Cleveland called the 'Grammar of Graphics').

```
library(ggplot2)
```

This library brings with it a data frame called diamonds. Have a look at the data.

```
R> diamonds
Source: local data frame [53,940 x 10]

   carat       cut  color clarity depth table price     x     y     z
   (dbl)    (fctr) (fctr)  (fctr) (dbl) (dbl) (int) (dbl) (dbl) (dbl)
1   0.23     Ideal      E     SI2  61.5    55   326  3.95  3.98  2.43
2   0.21   Premium      E     SI1  59.8    61   326  3.89  3.84  2.31
3   0.23      Good      E     VS1  56.9    65   327  4.05  4.07  2.31
4   0.29   Premium      I     VS2  62.4    58   334  4.20  4.23  2.63
5   0.31      Good      J     SI2  63.3    58   335  4.34  4.35  2.75
6   0.24 Very Good      J    VVS2  62.8    57   336  3.94  3.96  2.48
7   0.24 Very Good      I    VVS1  62.3    57   336  3.95  3.98  2.47
8   0.26 Very Good      H     SI1  61.9    55   337  4.07  4.11  2.53
9   0.22      Fair      E     VS2  65.1    61   337  3.87  3.78  2.49
10  0.23 Very Good      H     VS1  59.4    61   338  4.00  4.05  2.39
..   ...       ...    ...     ...   ...   ...   ...   ...   ...   ...
```

Notice the `[row x column]` ('arsey'!) comment. This tells us we have data on 53,940 diamonds (rows), and information on 10 different properties of each diamond.  

Let's plot `price` against `carat`(s). We use the `ggplot` function for this which needs to be told what data to use, which variable to put on the x-axis, and which on the y-axis. Things like the x-postion, the y-postion, the size and the colour of points are called 'aesthetics' in the grammar of graphics.

```
ggplot(data=diamonds, aes(x=carat, y=price))
```

Notice how we are passing the data and the aesthetics as 'arguments' to the function.

OK? No! Nothing happened. Aren't functions supposed to do something? In this case, `ggplot` prepares the data for the graph. Now you need to 'tell' ggplot what sort of graph you want. 

`Let's make a scatter plot.

```
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point()
```

![](img/gg-diamond-point.png)

What about a heat map. Perhaps you'd like to see how price varies with `carat` and `depth`.

```
ggplot(data=diamonds, aes(x=carat, y=depth, z=price)) + stat_summary_hex()
```

![](img/gg-diamond-hexbin.png)

---

## Exercises

## Questions

- [ ] TODO(2016-05-17): add swirl/r prog/workspaces to exercises

1. Can you explain the difference between the console and the source panes in R studio?
2. Have a look in the _workspace_ tab of the pane on the top right? What do you think is show here?
3. Try using the help function to find out what `ls()` does. Hint: try typing this in the search box of the _Help_ pane. Don't worry if the 'help' doesn't make much sense! 

- [ ] TODO(2016-05-12): change working directory (point and click, console)
4. Change working directory

## Answers

1. 