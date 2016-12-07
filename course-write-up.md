## Data science for Docs

The general public would assume that the medical profession are numerically literate. University educated, technically trained in biological science and more, and with the unique legal privilege of prescribing medicines where incorrect dosing leads to disaster, there would seem to be no excuse. However, most medics would deny any affinity with maths, and exude distaste for statistics. This is a truism even amongst anaesthetitics whose professional training includes physics and pharmacokinetics.

<!-- Set up need -->
Despite this public denial, we are nonetheless a data literate profession. We read and interpet scientific papers, we run audit projects, and write business cases for improvement projects. These are all intrinsically quantitative undertakings. However, this adopted posture gets in the way of our doing these things as well as possible, and engaging with statistics and data.

<!-- Data science, sexed up stats? -->
Data science would appear to be a rebranding of statistics. Despite underpinning quantum mechanics, modern finance, and the humble weather forecast, statistics never managed to be cool. At worst, it is cited as 'lies, damn lies and ...'. However, rename it to data science, chat about machine learning, and drop in an 'artificicial neural net', and you are part of the cool, new tech team.

The term data science can have a second intepretation. Most of the work of a practicing statistician is in preparing the data. This is no different to working in a wet lab where the 'killer' experiment can't be done until you have validated your re-agents, and calibrated your machines. The lab scientist carefully documents his or her work so that it can be reproduced, and the ability to reproduce a finding is what makes a result 'scientific'. Data science is the same. The preparatory work needs to be documented and reproducible for the final table, figure or 'statistical test' to have meaning. The skill of documenting your work, of making it scientific, has both value, and we believe wider application in the clinical world. 

<!-- the old workflow -->
The traditional work flow of the running an audit, or perfoming a small clinical study would normally start with a paper form. We'd test the form for usability, and then laboriously transcribe the responses into a spreadsheet. Even a simple task such as reporting the mean age by treatment group would involve writing formulas, or copy-pasting blocks of data before summarising. Additional data would mean repeating the entire process by hand, and if you came back to the project a few months later it would be difficult to remember the decisions you made to reproduce your previous work. More formal analysis would require both finding a friendly statistician or a license for SPSS, or another proprietary menu-driven statistical software package.

<!-- the new workflow -->
We believe that 'data science' actually summarises a much better alternative work flow. This involves writing down your work, and, in writing it down, you create the well documented, reproducible investigation that qualifies as science. The writing inevitably means writing code, but with modern tools this is achievable with a very small amount of training. It is with this premise that we have created the 'Data Science for Docs' course.

<!-- summarise the course  -->
The course uses the widely respected open source statistical computing language [R](), and an freely available application for working with **R** called [R studio](). We teach the concept of a data pipeline so that reproducibility becomes an immediate advantage. A single document, or script, encodes the steps necessary to take data from an online web form into R, and out into a report, a simple analysis, or a beautiful data visualisation. When new data is entered, a single key stroke is needed to re-run the entire analysis and update the output. When you come back to your work after a break, the steps required to produce your report are clearly documented. And when you want to share your work, it's as simple as sending a copy of your code to a collaborator. 

<!-- resources -->
The tools necessary to do this work are freely available. Data can becollected on an online form ([Google Forms]()), stored automatically in a [Google Sheet](), cleaned and analysed in R, and the graphs plotted interactively using online platforms such as [Plotly]().

<!-- links to data carpentry -->
We have heavily borrowed work from the established and respected [Software]() and [Data Carpentry]() courses that teach a similar approach for scientists from undergradudate to post-docs. However, we focus our course on scenarios (such as audit, surveys, and small clinical research projects) that are a feature of clinical work. This requires care where patient information is being used, but these are surmountable problems not impossible barriers. 

<!-- datathon -->
More recently we have run the course as a pre-workshop for a 'hack day' where clinicians, biostatisticians, and software engineers work together on a clinical problem. These have been using critical care data from the MIMIC database run by MIT (Boston, USA), and more recently from the NIHR's Critical Care Health Informatics Collaborative (CC-HIC). For the clinician, this course offers sufficient insight the tools available, and the challenges facing their non-clinical colleagues that a better conversation can be had.

### Conclusion

The course thus far has been supported but the [Software Sustainability Institute]() who pioneered the software and data carpentry courses mentioned above. We have also had enthusiastic support from the [National Institute of Academic Anaesthesia](). The materials for the course are freely available partly because we think this is the 'right thing' to do, partly to provide a reference for people before and after the course. Finally, we also create add all course participants to an online forum so that there is an obvious place to turn to when questions arise.

Next year we will extend the course to a two-day model where we offer a 'bring your own data' option on the second day. With a very high faculty to student ratio, we believe there is a very good chance that you might go away not just with a completed analysis but with a new set of skills.

