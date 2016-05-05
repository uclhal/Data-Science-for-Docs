---
layout: lesson
root: .
title: Reproducible science
minutes: 25
---

<!-- rename file with the lesson name replacing template -->

## Learning Objectives 

    This is a block of objectives


## Lesson 

- The idea that that data analyses, and more generally, scientific claims, are published with their **data** and **software code** so that others may verify the findings and build upon them.
- When given the same starting point, you can always have the same output. So that if someone else is given the same data, they will get the same results as you.

## This involves

- Writing scripts (software code)
- Commenting within the script about what you're doing

```{r}
#Load the data
x <- read.csv("https://raw.githubusercontent.com/datascibc/datastore/master/Breast%20research%20data-%20final1a.csv?token=AIlCxru--M8yReTXWh4hSpKIlf6BaEffks5XD230wA%3D%3D")

#See the 1st 3 column headers
names(x[ , 1:3])

#Simple summary stats
summary(x$Age)
```

## Traditional workflow

- Work with data in Excel

![Excel](img/Excel.png)

## Traditional workflow

- Import data into statistical software
- Create diagrams/figures on spreadsheet/stats package
- Cut and paste into Microsoft Word or Powerpoint
- Present/publish

## Problems

- Making mistakes whilst manipulating data
- Difficulty discerning what was done when passing data around
- Steps not clearly documented during analysis
- Tedious to go back and re-analyse if changes made

## Benefits of Reproducible Science

- Constant documentation of steps
- Easier to collaborate and share
- Automates steps, imagine n = 1,000,000
- Allows scrutiny of steps and external validation

## R Markdown

- A way of producing a document alongside code
- Integrates workflow into one environment
- Allows saving of changes and collaborating with Git

## R Code and Output

```{r}
summary(x)
```

##

```{r}
plot(Days_in_hosp ~ Age, data = x)
```

## Going under the hood

![Working in R Studio](img/WorkinginRstudio.png)

## Github

![Github](img/Github.png)

## R Studio

![R Studio Start](img/RstudioStart.png)

## Example of Reproducible Research Document Outputs

- [Blog post](http://dannyjnwong.github.io/Helipad-Analysis/)

- [.pdf](https://www.dropbox.com/s/g4rvar9g6ybrpeb/DistanceTimeAnalysis.pdf?dl=0)

- [Microsoft Word](https://www.dropbox.com/s/8h583pps6eo47na/DistanceTimeAnalysis.docx?dl=0)


## Exercises

### Questions

### Answers



---

[Previous topic]() --- [Next topic]()


