---
layout: lesson
root: .
lastupdated: May 5, 2016
contributors: ["Ahmed Al-Hindawi", "Finn Catling", "Steve Harris", "Ed Palmer", "Danny Wong"]
maintainers: ["Steve Harris"]
domain: Clinical 
topic: Critical Care
software: R
dataurl_1: https://ndownloader.figshare.com/files/5094199?private_link=aff8f0912c76840c7526
dataurl_2: https://figshare.com/s/165cad3ce6eadbf6b19a
status: Under Development 
twitter_url: https://twitter.com/datascibc
---

<!-- USING THIS LESSON TEMPLATE -->
<!-- Lesson specific information is taken from the YAML header at the top of the page -->

<!-- THE LESSON INFORMATION -->


# {{ page.domain }} Data Science  for {{ page.topic }}

Data Science for Doc's aim is to teach doctors, nurses, and other health care professionals basic concepts, skills, and tools for working more effectively with data. The lessons below were designed for those interested
in working with {{page.domain %}} data in {{page.topic %}}.


**Content Contributors: {{page.contributors | join: ', ' %}}**

We have borrrowed heavily from the excellent [Data Carpentry programme](http://datacarpentry.org) in producing this course. However, this is _not_ a data carpentry course. We do not meet their specications (yet), although this is something we are working toward.


**Lesson Maintainers: {{page.maintainers | join: ', ' %}}**


**Lesson status: {{ page.status }}**

<!--
  [Information on Lesson Status Categories]()
-->

<!-- ###### INDEX OF LESSONS ON THIS TOPIC ###### -->

## Before your first lesson ...

Here is a quick checklist but you'll do best to follow the [instructions here](prerequisites.html).

- bring your own laptop
- install R
- install R studio
- sign up for a Google docs account
- download and install a speadsheet programme

Full details of the pre-course preparation are available [here](prerequisites.html). If you're interested in why we're recommending in [R](http://www.r-project.org), then you might enjoy reading [this](why-r.html).

Finally, please complete the [pre-course survey](http://goo.gl/forms/odmaxWP2KBHyzKti2).

## Lessons:

We'll cover a number of lessons during the 2 days. The programme is flexible, but an outline is available [here](CourseProgramme.html).

1. [Preliminaries](00-lesson-00-intro.html)
2. [R for newbies](01-lesson-01-r-for-newbies.html)
3. [Excel Hell](02-lesson-02-excel-hell.html)
4. [Getting data into R](03-lesson-03-getting-data-into-r.html)
5. [Data wrangling](04-lesson-04-data-wrangling.html)
6. [Data visualisation](05-lesson-05-dataviz.html)
7. [Plotting graphs with ggplot2](06-lesson-06-ggplot2.html)
8. [Just enough statistics](07-lesson-07-just-enough-statistics.html)
9. [Data analysis practical](08-lesson-08-data-analysis-worksheet.html)

<!-- 6. [Just enough statistics](06-lesson-06-just-enough-statistics.html) -->

## Data

Data files for the lesson are available here: 

- An [RCT]({{page.dataurl_2%}}) comparing post-operative pain control after axillary node dissection with local anaesthetic infiltration via the drain versus injection to the skin flaps (Thanks to Muska Khpal)
- [SPOTlight study data]({{page.dataurl_1 %}}): an observational study of deteriorating ward patients referred to critical care

You are also encourage to bring along your own data. We can't promise to spend time on this, but there are exercises to do along the way, and you might want to try these exercises out on your own work.

## Help ##

Where to get help? Firstly, we'd strongly encourage you to ask the group. To this end, we have set up a [slack group](https://datascibc.slack.com) - this is an instant messaging service (like whatsapp or similar) but with much better tools for sharing files, and working with code. If you're on the course, you should already have received an invite. Let us know if not. 

We'd also recommend the following

- searching on a website called [Stack Overflow](http://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example/5965451#5965451)
- Use the cheat sheets provided by the people who make [R Studio](https://www.rstudio.com/resources/cheatsheets/)
- Try one of these websites
    + [Cookbook for R](http://www.cookbook-r.com)
    + [Quick-R](http://www.statmethods.net)
    + [ggplot 2 reference](http://docs.ggplot2.org/dev/reference.html)
    + [Learn R in R!](http://swirlstats.com)

<p><strong>Twitter</strong>: @datascibc
