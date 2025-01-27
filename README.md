# HTMLBeautifier
This is a small HTML beautifier created in Shell.
For usage, download the file in your computer( if you are using a directive by Linux, otherwise please use a WSL or a VM).
You may have to change the permissions of the file. In this case use:
 chmod +x HTMLBeautifier.sh
After that you should be able to use the beautifier, adding as a parameter the html file you want to format:
 ./HTMLBeautifier.sh name_of_file.html
In a few seconds, the new generated code should be displayed in the terminal.

#Attention! 
This is a small project that only adds or removes any kind of spaces( tabs, newlines, blank spaces etc.) and adds tabs in order for your code to respect the correct hierarchy.
It has an erroneous behavior when it finds certain keywords (example: the word type in the script tag when you want to branch a js file to the html file) so please verify the output code when generated.
