---
layout: lesson
root: .
title: R for newbies
minutes: 25
---

<!-- - [ ] TODO(2016-05-12): 
- more detail on the different panes in R studio
    - explain tabs and panes
    - explain ...

  -->


- [ ] TODO(2016-05-18): finding you way around R studio (hand out)
- [ ] TODO(2016-05-18): functions and data as building blocks
- [ ] TODO(2016-05-17): add swirl/r prog/workspaces to exercises

## Learning Objectives 

- [Why R](#why-r)
- [Find your way around RStudio](#start-rstudio-and-have-a-look-around)  
- [R building blocks](#r-building-blocks)
- [Follow me](#follow-me)

## Lesson 

<a name="why-r"></a>

### Why R?

This is the long-story short version, but see [here](why-r.html) for more detail.

Why do people think R is hard? Because it's not a GUI (pronounced gooey!). No more point and click. You have to write stuff down. Sounds like a disadvantage? We want to convince you otherwise. 

Two good reasons:

- **Science should be reproducible**. You can't record point and clicks. But you can re-run your 'code'.
- **Long term gain from upfront investment**. If you have ever done a bunch of work preparing a table or a graph, and then discovered that either you have a new data point to add, or the next month's results are available then the GUI approach means starting all the pointing-and-clicking from scratch. But write it down once, re-run as often as you wish.

The underlying principle of what we want to show you is how to build a data pipeline. You start with your data in a spreadsheet. You write a bunch of instructions (a script) using the R language. Your script produces an output (a table or a figure). Run your script. Generate your output. Change your data. Run the _same_ script. Instantly re-generate your updated output. 

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

The number in square brackets is actually R 'numbering' your answer for you. There's only one answer so it is 'numbered' `1`.[^3]

Re-assuring as it is that R knows that `2+2=4`, you were probably hoping for a little more. Typing directly into R is a start, but we want to teach you _reproducible_ research. The scientific method requires that we document our work, but we can't reproduce your typing unless we record it somewhere. 

<a name="keep-a-lab-book-of-your-work"></a>

#### Source (top left)

The console is also called an _interactive_ R session. What you type here is gone when you close down R. The source pane is simply a view into a text file (with the `.R` extension) that allows you to document, edit, correct and _most importantly_ save your work. The next time you come back to R, you re-open the file, and replay your commands. Got it? Then you're now starting to follow the principles of reproducible research.

The solution is to create a file, write your commmands in that file, and then tell R to work through the commands in that file. Switch to the pane labelled source, and this time type `2-2`. 

Now typing <enter> brings you to a new line. But go back to the line with `2-2` and hit <command-enter> (on Windows <control-enter>) instead. This sends the last line you wrote from the 'source' document, to the console. You should now see that R can add and substract!

    > 2+2
    [1] 4
    > 2-2
    [1] 0

Now save the file you have written as `labbook_YYMMDD.R` (replace YYMMDD with today's date e.g. `labbook_160103.R`). You must use the `.R` extension to indicate that this is an R script, but you can, of course, choose any name you wish.[^2] 

### R building blocks

I want to argue that there are only two building blocks within R.

- data
- functions

#### Data

We are about to use a bunch of very 'math-y' words. Please do not be put off!

We use R to handle data. Around 500 years ago, Gauss (of the famous Gaussian (aka Normal) distribution) and colleagues figured out it was easier to work with bunches of equations by writing them down as matrices.

For example, let's try and predict your probability of dying in Intensive Care (`dead1`) using your age (`age`) and your heart rate (`hrate`).

Here's my data:

    +-----+-------+-------+
    | age | hrate | dead1 |
    +-----+-------+-------+
    | 41  |  80   | 0     |
    | 80  | 100   | 1     |
    | 21  | 180   | 0     |
    | 60  |  70   | 1     |
    +-----+-------+-------+

Now if you model these data (using logistic regression), then R will try to 'guess' what numbers (coefficients) would best be used to multiply each of age and heart rate to get you as close to dead (`1`) or alive (`0`) as possible. 

We can guess and get close. Let's convert our predictions to percentages (`dead100`) to make life easier.

    +-----+-------+---------+
    | age | hrate | dead100 |
    +-----+-------+---------+
    | 41  |  80   |   0     |
    | 80  | 100   | 100     |
    | 21  | 180   |   0     |
    | 60  |  70   | 100     |
    +-----+-------+---------+

If we add age to heart rate divided by 5 then we'll get a prediction.

    (1 x age) + (1/5 x hrate) 



names 
rows and columns
vectors and matrices



#### Functions

Think of functions as litte machines. They perform tasks. To perform a task, they need an input, and the result of their work is the output. 

![](img/function-anatomy.png)

    R> say_hello("Steve")
    [1] "Hello Steve"

R comes with a bunch of functions pre-installed called. These are called 'base R'. However, there are thousands of additional functions packaged together into libraries that you will want to use too. You load these by calling (surprise, surprise) a base R function called `library`.

    library(ggplot2)

<a name="follow-me"></a>

### Follow me

- [ ] TODO(2016-05-08): show off a little bit; perhaps download the gap minder data and make some nice plots; get people enthused; run a quick statistical test 



## Exercises

## Questions

1. Can you explain the difference between the console and the source panes in R studio?
2. Have a look in the _workspace_ tab of the pane on the top right? What do you think is show here?
3. Try using the help function to find out what `ls()` does. Hint: try typing this in the search box of the _Help_ pane. Don't worry if the 'help' doesn't make much sense! 

- [ ] TODO(2016-05-12): change working directory (point and click, console)
4. Change working directory

## Answers

1. 