# This is a list of useful commands that have aided me throughout my hacking

# export .md to .pdf
pandoc --latex-engine=xelatex -V mainfont="Times New Roman" -V fontsize=12pt -V geometry:margin=1in -V documentclass=article -V linestrech=1.5 -V link-as-notes SOURCE.md -s -o DESTINATION.pdf

# Search for suffix type files, but only print the paths to directories that contain them.
find . -name '*.<suffix>' | sed 's/\/[^\/]*$//' | sort | uniq

# snow at the terminal
clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
