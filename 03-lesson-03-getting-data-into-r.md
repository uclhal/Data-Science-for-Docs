---
layout: lesson
root: .
title: Data pipelines
minutes: 25
---

<!-- rename file with the lesson name replacing template -->

Learning Objectives
-------------------

1.  [Introducing the data pipeline](#pipeline)
2.  [Doing a quick nose around dataframes in R](#dataframes)
3.  [Get data out of your spreadsheet](#csv)
4.  [Importing: Point and click in R studio](#clicking)
5.  [Importing: Scripting your import (and file paths)](#scripting)
6.  [Importing: Using Google Sheets](#google-sheets)

<!-- * Getting data into R - (v1) Ahmed (v2) Ed (v3) Steve

keep theme of square tables frome excel to csv now to data.frame
how to get these in
how to do this 'automagically'

 -->
Lesson
------

<a name="pipeline"></a>

The data pipeline
-----------------

<!-- - [ ] TODO(2016-11-15): produce a graphic for this -->
### Traditional workflow

1.  Collect data on paper
2.  Transcribe paper forms into Excel or similar
3.  Import Excel into SPSS or another stats package
4.  Perform analyses and make graphs
5.  Copy/paste these into your final document (Word, Powerpoint) etc

### Problems

-   One early mistake, means repeating all steps by hand
-   You can't remember what you did because you haven't looked at this
    for 5 days, 5 months or 5 years
-   Other people can't collaborate or help because all the files are
    local, and even if they have them you weren't obsessive enough to
    write notes about each step

### A data pipeline (aka scripting)

Learn just enough code to write down your 'workflow'. Ensure the
workflow starts with the raw data, and then any changes in the workflow
or the data will automatically propagate.

Examples

-   make a google form, link the googlesheet from the form to an R
    script which produces a graph
-   write your next paper by interspersing code and text (something
    called knitting!) so that when your 'run' the file the text, the
    tables, and the figures are all made in one go

<a name="dataframes"></a>

Everything becomes a "data-frame"
---------------------------------

Excel sheets in R are called 'dataframes'. It has columns, each
identified by a name, and rows for observations. This means that however
you import your data into R within your pipeline, those data will end up
as a dataframe. Let's do a quick tour of dataframes in R.

R comes preloaded with different bits of data for you to explore. A
famous data set describes characteristics of iris'.

    # Let's look at some data that comes with R
    data()

    # Let's pick one to play with (we'll label it 'df')
    df <- iris

    # Have a look at the data
    head(df)

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.1         3.5          1.4         0.2  setosa
    ## 2          4.9         3.0          1.4         0.2  setosa
    ## 3          4.7         3.2          1.3         0.2  setosa
    ## 4          4.6         3.1          1.5         0.2  setosa
    ## 5          5.0         3.6          1.4         0.2  setosa
    ## 6          5.4         3.9          1.7         0.4  setosa

Just like in Excel, any item (cell) can be accessed by its coordinates
in the table.

    df[1,1]         # top left cell

    ## [1] 5.1

    df[150,5]       # bottom right cell

    ## [1] virginica
    ## Levels: setosa versicolor virginica

    df[1, ]         # first row

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.1         3.5          1.4         0.2  setosa

    df[ ,1]         # first column

    ##   [1] 5.1 4.9 4.7 4.6 5.0 5.4 4.6 5.0 4.4 4.9 5.4 4.8 4.8 4.3 5.8 5.7 5.4
    ##  [18] 5.1 5.7 5.1 5.4 5.1 4.6 5.1 4.8 5.0 5.0 5.2 5.2 4.7 4.8 5.4 5.2 5.5
    ##  [35] 4.9 5.0 5.5 4.9 4.4 5.1 5.0 4.5 4.4 5.0 5.1 4.8 5.1 4.6 5.3 5.0 7.0
    ##  [52] 6.4 6.9 5.5 6.5 5.7 6.3 4.9 6.6 5.2 5.0 5.9 6.0 6.1 5.6 6.7 5.6 5.8
    ##  [69] 6.2 5.6 5.9 6.1 6.3 6.1 6.4 6.6 6.8 6.7 6.0 5.7 5.5 5.5 5.8 6.0 5.4
    ##  [86] 6.0 6.7 6.3 5.6 5.5 5.5 6.1 5.8 5.0 5.6 5.7 5.7 6.2 5.1 5.7 6.3 5.8
    ## [103] 7.1 6.3 6.5 7.6 4.9 7.3 6.7 7.2 6.5 6.4 6.8 5.7 5.8 6.4 6.5 7.7 7.7
    ## [120] 6.0 6.9 5.6 7.7 6.3 6.7 7.2 6.2 6.1 6.4 7.2 7.4 7.9 6.4 6.3 6.1 7.7
    ## [137] 6.3 6.4 6.0 6.9 6.7 6.9 5.8 6.8 6.7 6.7 6.3 6.5 6.2 5.9

Most of the time the rows are 'observations' and we want to pick out
'characteristics' of those observations (i.e. the columns). Rather than
having to remember the column number, we can just ask for a columm by
name using the `$` operator: e.g. df$some\_column

    df$Species

    ##   [1] setosa     setosa     setosa     setosa     setosa     setosa    
    ##   [7] setosa     setosa     setosa     setosa     setosa     setosa    
    ##  [13] setosa     setosa     setosa     setosa     setosa     setosa    
    ##  [19] setosa     setosa     setosa     setosa     setosa     setosa    
    ##  [25] setosa     setosa     setosa     setosa     setosa     setosa    
    ##  [31] setosa     setosa     setosa     setosa     setosa     setosa    
    ##  [37] setosa     setosa     setosa     setosa     setosa     setosa    
    ##  [43] setosa     setosa     setosa     setosa     setosa     setosa    
    ##  [49] setosa     setosa     versicolor versicolor versicolor versicolor
    ##  [55] versicolor versicolor versicolor versicolor versicolor versicolor
    ##  [61] versicolor versicolor versicolor versicolor versicolor versicolor
    ##  [67] versicolor versicolor versicolor versicolor versicolor versicolor
    ##  [73] versicolor versicolor versicolor versicolor versicolor versicolor
    ##  [79] versicolor versicolor versicolor versicolor versicolor versicolor
    ##  [85] versicolor versicolor versicolor versicolor versicolor versicolor
    ##  [91] versicolor versicolor versicolor versicolor versicolor versicolor
    ##  [97] versicolor versicolor versicolor versicolor virginica  virginica 
    ## [103] virginica  virginica  virginica  virginica  virginica  virginica 
    ## [109] virginica  virginica  virginica  virginica  virginica  virginica 
    ## [115] virginica  virginica  virginica  virginica  virginica  virginica 
    ## [121] virginica  virginica  virginica  virginica  virginica  virginica 
    ## [127] virginica  virginica  virginica  virginica  virginica  virginica 
    ## [133] virginica  virginica  virginica  virginica  virginica  virginica 
    ## [139] virginica  virginica  virginica  virginica  virginica  virginica 
    ## [145] virginica  virginica  virginica  virginica  virginica  virginica 
    ## Levels: setosa versicolor virginica

    df$Petal.Length

    ##   [1] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 1.5 1.6 1.4 1.1 1.2 1.5 1.3
    ##  [18] 1.4 1.7 1.5 1.7 1.5 1.0 1.7 1.9 1.6 1.6 1.5 1.4 1.6 1.6 1.5 1.5 1.4
    ##  [35] 1.5 1.2 1.3 1.4 1.3 1.5 1.3 1.3 1.3 1.6 1.9 1.4 1.6 1.4 1.5 1.4 4.7
    ##  [52] 4.5 4.9 4.0 4.6 4.5 4.7 3.3 4.6 3.9 3.5 4.2 4.0 4.7 3.6 4.4 4.5 4.1
    ##  [69] 4.5 3.9 4.8 4.0 4.9 4.7 4.3 4.4 4.8 5.0 4.5 3.5 3.8 3.7 3.9 5.1 4.5
    ##  [86] 4.5 4.7 4.4 4.1 4.0 4.4 4.6 4.0 3.3 4.2 4.2 4.2 4.3 3.0 4.1 6.0 5.1
    ## [103] 5.9 5.6 5.8 6.6 4.5 6.3 5.8 6.1 5.1 5.3 5.5 5.0 5.1 5.3 5.5 6.7 6.9
    ## [120] 5.0 5.7 4.9 6.7 4.9 5.7 6.0 4.8 4.9 5.6 5.8 6.1 6.4 5.6 5.1 5.6 6.1
    ## [137] 5.6 5.5 4.8 5.4 5.6 5.1 5.1 5.9 5.7 5.2 5.0 5.2 5.4 5.1

### Exercise: Taking a quick look at the data

1.  What are the names of the columns? Hint: try `names()`
2.  Display in the console the items in the column `Sepal.Lengths`
3.  What is the mean of and standard deviation of `Sepal.Lengths`?
4.  What is the median, interquartile range, min and max of
    `Sepal.Lengths?`
5.  Can you do the same for all the other columns in `df`?

<a name="csv"></a>

Introducing the CSV
-------------------

CSV, a Comma Seperated Values, is a file that will contain your data.
This is easily exportable from Microsoft Excel, Apple Numbers, Open
Office, Google Sheets...etc.

It's a simple format. The top line are the column names, each seperated
by a comma. The following lines are the observations in those columns,
again, seperated by a comma.

It's strength is in it's simplicity. It only has data, no formuals, no
tricks and is very well recognised amongst software packages as it is
very easily supported. R has excellent support for CSV.

Export CSV From Excel
---------------------

![](img/export_csv.png)

### Exercise: Export an .xlsx file to .csv

1.  Find the cleaned .xlsx file that was produced in the Excel Hell
    lecture and export it as a .csv file.

Find your File
--------------

You will need to know the absolute location of your file on your
harddrive.

![](img/mac_path_small.png)

Find your File
--------------

This will result in the following path:

    /Users/ahmedalhindawi/Documents/Development/Man_graph.xls

On Windows: Shift+Right click on file. Choose Copy As Path. A similar
path will appear.

Using in-built function
-----------------------

We can import Comma Separated Values (CSV) files into R very easily.
These files can be generated by Microsoft Excel, Apple Numbers and
Google Sheets usually through a File -&gt; Export process.

Once a sheet has been exported, it can be imported into R:

There're 3 main ways to do this:

1.  Point-and-click within RStudio, which we covered in Lesson 1 (R
    for Newbies).
2.  Make a connection to a database or an online Google Sheets
    spreadsheet
3.  Use the `read.csv` function.

<a name="clicking"></a>

### Point-and-click

As a quick reminder from Lesson 1. Click the *Import Dataset* button,
and select the *From local file ...* option.

![](img/RStudio-import-data-button.png)

Then accept the defaults in the dialog box that appears.

![](img/RStudio-import-data.png)

<a name="scripting"></a>

### Scripting

Point and click is lovely and easy but *sadly* not reproducible. Much
better is to write down where your data comes from. We are going to do
this in 2 steps here.

1.  We will take the *file path* you have generated and name it `FILE`.
2.  We will use a *function* called `read.csv` to import the data into a
    data frame (which we in turn name `df` for convenience).

<!-- -->

    myfile <- "/Users/ahmedalhindawi/Documents/Development/Man_graph.csv"
    df <- read.csv(myfile, header=TRUE, stringsAsFactor=FALSE)

You could have done this in one step, but it would have made things
harder to read. Hard to read, means difficult to remember, and we are
doing our best to avoid that!

Now you can access the data you imported. For example, to display the
entire column named 'column\_name\`. Replace with with the name of the
column you're interested in.

    df$column_name

    ## NULL

### Exercise: Import the .csv into R

1.  Import the .csv file from the Excel Hell lesson as a dataframe and
    call it `RCT`
2.  Name all the columns in the dataframe.

<a name="google-sheets"></a>

Google Sheets
-------------

We can also load data through a connection with Google Sheets. What's
good about this? **Collaboration** and **live-updating**. Let's use this
system to import a cleaned version of the breast RCT data we have been
working on.

We're going to use data in a shared sheet we've called
`dsbc-pipeline-love`.

![](img/rct-clean-shot1.png)

The sheet is available
[here](https://docs.google.com/spreadsheets/d/1LEZfjgeS-zjF0Jl79cFO7i2PBv0EngefZ4FUA0l1iyU/edit?usp=sharing).

### The `googlesheets` library

For this part of the lesson, open a new R script file, save it as
`googlesheets_lesson.R`.

First we need the functions someone else has kindly written that allow R
to talk to R studio. You might need to install the library first
(`install.packages("googlesheets")`).

    # install.packages("googlesheets")
    library(googlesheets)

Now let's have a look at the sheets in your account. We'll use the
`gs_ls()` function.

    gs_ls()

The first time you run this you will be asked to authenticate. Behind
the scenes R now saves a hidden file into your working directory. The
next time you ever run your script, as long as you haven't moved your
code to a new directory, it won't need to ask.

Let's import the shared sheet `dsbc-pipeline-love`, and name it `sheet`.

    sheet <- gs_title("dsbc-pipeline-love")

So far so good, but `sheet` isn't a data frame. There's one more step.

    goog <- gs_read(sheet)

Let's have a look at the first 6 rows (remember the `head()` function?)

    head(goog)

### Exercise: Taking a quick look at the data

1.  What are the names of the columns?

2.  Can you have a look at the column containing the age of the
    patients?

3.  Can you find out how many patients were randomised to each arm?
    Hint: you can use the function `table()` or `xtab()`

4.  Can you find out how many subjects there are?

### Answers

1.  What are the names of the columns?

`names(goog)`

1.  Can you have a look at the column containing the age of the
    patients?

`goog$age`

1.  Can you find out how many patients were randomised to each arm?
    Hint: you can use the function `table()` or `xtab()`

`table(goog$random)`

1.  Can you find out how many subjects there are?

`nrow(goog)`

Homework
--------

1.  Can you import and look at the `outreach.csv` dataset? What is the
    average heart rate? How many patients were accepted to ICU (the
    column is called `icu_accept`), and what was the mortality?

------------------------------------------------------------------------

[Previous topic](02-lesson-02-excel-hell.html) --- [Next
topic](04-lesson-04-04-reproducible-science.html)
