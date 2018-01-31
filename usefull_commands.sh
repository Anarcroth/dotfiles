# This is a list of useful commands that have aided me throughout my hacking

# export .md to .pdf
pandoc --latex-engine=xelatex -V mainfont="Times New Roman" -V fontsize=12pt -V geometry:margin=1in -V documentclass=article -V linestrech=1.5 -V link-as-notes SOURCE.md -s -o DESTINATION.pdf
