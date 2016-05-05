---
layout: lesson
root: .
title: R for newbies
minutes: 25
---

## Learning Objectives 

- [Install R and RStudio](#download-and-install-r-and-rstudio)  
- [Find your way around RStudio](#start-rstudio-and-have-a-look-around)  
- [Keep a lab book of your work](#keep-a-lab-book-of-your-work)

## Lesson 

We're going to get you up and running in **R** which is a highly respected, free statistics package used by academics around the world. We will also install a _friendly_ interface to R called _RStudio_.

## Download and install R and RStudio

1. Download and install R from [here](https://cran.rstudio.com)

2. Download and install RStudio. This is a nice shiny interface for R, and the easiest way to use it. Download it [here](https://www.rstudio.com/products/rstudio/download/). There should be an 'installer' for your operating system.

## Start RStudio and have a look around

![](img/r-studio-windows-vanilla.jpeg)

The screen should be divided in quadrants or panes. The two most important are labelled _Source_ (top left), and _Console_ (bottom left). 

### Console

The console _is_ R! Type anything here, and it will be interpreted by R.

Try typing `2+2`

     > 2+2
    [1] 4

There are 4 things to explain in the little code snippet above.

1. The command prompt "`>`" (or greater than sign to you and me) is simply R prompting you to enter some text
2. The expression `2+2` is the sum that we asked R to perform.
3. We'll come back to the `[1]` at the beginning of the next line in a moment.
4. R prints the answer `4`

The number in square brackets is actually R 'numbering' your answer for you. There's only one answer so it is 'numbered' `1`.[^3]

Re-assuring as it is that R knows that `2+2=4`, you were probably hoping for a little more. Typing directly into R is a start, but we want to teach you _reproducible_ research. The scientific method requires that we document our work, but we can't reproduce your typing unless we record it somewhere. 

### Keep a lab book of your work

The solution is to create a file, write your commmands in that file, and then tell R to work through the commands in that file. Switch to the pane labelled source, and this time type `2-2`. When you get to the end of the line, hit <command-enter> (on Windows <control-enter>). This sends the last line you wrote from the 'source' document, to the console. You should now see that R can add and substract.

    > 2+2
    [1] 4
    > 2-2
    [1] 0

Now save the file you have written as `labbook_YYMMDD.R` (replace YYMMDD with today's date e.g. `labbook_160103.R`). You must use the `.R` extension to indicate that this is an R script, but you can, of course, choose any name you wish.[^2] 

## Exercises

## Questions

1. Can you explain the difference between the console and the source panes in R studio?
2. Have a look in the _workspace_ tab of the pane on the top right? What do you think is show here?
3. Try using the help function to find out what `ls()` does. Hint: try typing this in the search box of the _Help_ pane. Don't worry if the 'help' doesn't make much sense! 

## Answers

1. The console is also called an _interactive_ R session. What you type here is gone when you close down R. The source pane is simply a view into a text file (with the `.R` extension) that allows you to document, edit, correct and _most importantly_ save your work. The next time you come back to R, you re-open the file, and replay your commands. Got it? Then you're now starting to follow the principles of reproducible research.