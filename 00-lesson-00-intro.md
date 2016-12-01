---
layout: lesson
root: .
title: Introduction lecture
minutes: 25
dataurl_1: https://drive.google.com/file/d/0Bw_vg8ODL-GaM01iN2FyeE82SDA/view?usp=sharing
---

<!-- rename file with the lesson name replacing template -->

## Learning Objectives 

- [Preliminaries](#preliminaries)
- [Prerequisites](#prerequisites)
- [Introducing the data](#introducing-the-data)
- [Files and directories](#files-and-directories)

## Lesson 

<a name="preliminaries"></a>

### Preliminaries

- Sticky notes (red and green)
- A working internet connection (please use the hospital wireless)
- Introduce youselves on Slack (use the web interface, or download the app to your computer or phone)
- Pair programming
- Live coding

<a name="prerequisites"></a>

### Pre-requisites

This is an opportunity to check that you were able to complete all the pre-requisites that were sent out in the pre-course email. Everything is detailed [here](prerequisites.html) is you are looking for the instructions

- Install R
- Install R studio
- Sign up for a Google docs account
- Download and install a speadsheet programme
- Join Slack
- Mac OSX Users: Please open a Terminal and type `xcode-select--install` and follow the onscreen instructions

<a name="introducing-the-data"></a>

### Introducing the data

We'd like to introduce three data sources that will be using during the course.

- a Google drive folder

- An [RCT]({{page.dataurl_1%}}) comparing post-operative pain control after axillary node dissection with local anaesthetic infiltration via the drain versus injection to the skin flaps (Thanks to Muska Khpal)

Please note (_stern tone of voice!_) that any data that is placed on the internet **cannot** include any patient identifiers.

You are also encourage to bring along your own data. We can't promise to spend time on this, but there are exercises to do along the way, and you might want to try these exercises out on your own work.

<a name="files-and-directories"></a>

### Files and directories

It's going to be helpful to have an understanding of how files and folders (aka directories) are named on your computer because unlike your usual habit of pointing and clicking to open something, we will need to start writing things down.

Very briefly.

- Directories (folders) contain files and other directories.
- Files have a 'name', and an 'extension' (traditionally a three letter code telling the computer what sort of file it was)
- The 'root' directory is the start of this tree.
    + On Windows machines you'll be used to thinking of the root as the `C:\` drive (a back slash)
    + On a Unix machine (Mac OS X and Linus), the root is just `/` (a forward slash)
- You can write the _absolute_ 'path' to any file as if you walked along the branch of the tree from the 'root' to the file. For example, if you saved a Word document on your desktop called `readme`:
    + Windows: `C:\Users\steve\desktop\readme.docx`
    + Unix: `/Users/steve/desktop/readme.docx`
- You can write the _relative_ 'path' to any file as if you walked from one file (or directory) to another. Sometimes this means walking _up_ the branch to descend another one. To walk up a level you type `..`. For example, if you are working in your `documents` folder which is at 

    + Windows: `C:\Users\steve\documents`
    + Unix: `/Users/steve/documents`

    And you want to go to the same `readme.docx` file as before. You would type

    + Windows: `..\desktop\readme.docx`
    + Unix: `../desktop/readme.docx`

    which reads as 'go up one level' (the `..`), then go down into a folder called `desktop`, and then to the file called `readme.docx`
- Finally, the `.` (single not double dot) is just the short cut for the _current_ directory. So `./readme.docx` simply means the file called `readme.docx` in _this_ directory. Seems pedantic but that's computers for you!

You can see the path to any file or directory by right clicking and looking for properties (Windows), or using the 'Get Info' menu item (Mac OS X).


## Exercises

1. Set-up a 'projects' directory somewhere, of your choosing, on your computer. Create a project called 'ds4d-course', and within it create separate folders called notes, data, code, and temp (for temporary). 

2. Have a quick look at the [Software Carpentry lesson](http://swcarpentry.github.io/shell-novice/01-filedir.html) on files and directories.



---

[Previous topic](index.html) --- [Next topic](01-lesson-01-r-for-newbies.html)


