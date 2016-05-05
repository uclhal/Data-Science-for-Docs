---
layout: lesson
root: .
lastupdated: May 5, 2016
contributors: ["Steve Harris", "Ahmed Al-Hindawi", "Finn Catling", "Ed Palmer", "Danny Wong"]
maintainers: ["Steve Harris"]
domain: Clinical 
topic: Critical Care
software: R
dataurl_1: https://ndownloader.figshare.com/files/5094199?private_link=aff8f0912c76840c7526
status: Under Development
---

<!-- USING THIS LESSON TEMPLATE -->
<!-- Lesson specific information is taken from the YAML header at the top of the page -->

<!-- THE LESSON INFORMATION -->


# Data Carpentry {{ page.topic }} for {{ page.domain }}

Data Carpentry's aim is to teach researchers basic concepts, skills,
and tools for working more effectively with data.
The lessons below were designed for those interested
in working with {{page.domain %}} data in {{page.topic %}}.


**Content Contributors: {{page.contributors | join: ', ' %}}**


**Lesson Maintainers: {{page.maintainers | join: ', ' %}}**


**Lesson status: {{ page.status }}**

<!--
  [Information on Lesson Status Categories]()
-->

<!-- ###### INDEX OF LESSONS ON THIS TOPIC ###### -->

## Lessons:


1. [R for newbies](01-lesson-01-r-for-newbies.html)


## Data

Data files for the lesson are available here: 

- [SPOTlight study data]({{page.dataurl_1 %}}): an observatinal study of deteriorating ward patients referred to critical care


### Requirements

Data Carpentry's teaching is hands-on, so participants are encouraged to use
their own computers to insure the proper setup of tools for an efficient workflow.
*These lessons assume no prior knowledge of the skills or tools*, but working
through this lesson requires working copies of the software described below.
To most effectively use these materials, please make sure to install everything
*before* working through this lesson.




{% if page.software == "Python" %}
{% include pythonSetup.html %}
{% elsif page.software == "Spreadsheets" %}
{% include spreadsheetSetup.html %}
{% elsif page.software == "R" %}
{% include rSetup.html %}
{% else %}
{% include anySetup.html %}
{% endif %}

<p><strong>Twitter</strong>: @datacarpentry
