# HTMLBeautifier
## What is it?
This is a program that creates a clean version of the users html code, using all the rules for correct identation for a better understandind/reading of the code.

## Reasons behind the project
- While I read through the lines of code in HTML on a previous project, I discovered that messed up identation can cause some errors later on( e.g. forgeting to close a tag or dificulties in updating the code), so I created this small program that takes the source code and "beautifies" it by adding or removing tabs for a easier to read version that will be parsed on the terminal.
- This way, I learned about the differences between closing tags and what a huge difference is to read a clean code and I added some deep comprehension using the bash shell and grep function in the pipelines.

## Features
- Takes the code from the user and cleans it by merging all the lines in one alone, getting ride of the spaces, tabs and newlines
- With the rules of adding or removing tabs after the specific tag that is discovered (adding the tabs only for opening tags that must have a closing tag, removing a tab after a closing tag)

## Language used
Shell/Bash

## How to use it
Before you use it, take notes that you will need a distribution of Linux or to work with a Virtual Machine/ WSL.
- Step 1: download the code from the repo
- Step 2: change the permission of the file in order to be executable
`chmod +x HTMLBeautifier.sh`
- Step 3: run the program using as paramether the source code in html
`./HTMLBeautifier.sh name_of_file.html`

After the program runs, short after the beautified code will be parsed in the terminal.

## Screenshots from a test
![Mess1](https://github.com/lorenabora/HTMLBeautifier/blob/main/htmlTest/messy1.jpeg)
* As you can see, the identation is a totally mess.
![Mess2](https://github.com/lorenabora/HTMLBeautifier/blob/main/htmlTest/messy2.jpeg)
![Clear1](https://github.com/lorenabora/HTMLBeautifier/blob/main/htmlTest/clear1.jpeg)
* And now this is how it looks after I run the beautifier.
![Clear2]()

## Lessons learnt
1. Multiple spaces/tabs/newlines can be a headache, so better get ride of those and work with a draft of the code.
2. GREP is a lifesavior and a powerfull tool when you want to get some information from a specific location
3. Self-closing tags need special treatment( if was challenging for the identation because some key-words actually got skipped in the first rounds of testing)

## Attention!
Working on it and after several tests, I observed an annomaly: it has an erroneous behavior when it finds certain keywords (example: the word type in the script tag when you want to branch a js file to the html file) so please verify the output code when generated. Overall, it should be fine, but a small word can add a tab where you least expect.
