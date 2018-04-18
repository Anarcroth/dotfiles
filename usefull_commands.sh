# This is a list of useful commands that have aided me throughout my hacking

# Export .md to .pdf
pandoc --latex-engine=xelatex --wrap=auto -p --highlight-style=kate -V mainfont="Times New Roman" -V fontsize=12pt -V geometry:margin=1in -V documentclass=article -V linestrech=1.5 -V colorlinks -V link-as-notes SRC.md -s -o DEST.pdf

# Search for suffix type files, but only print the paths to directories that contain them.
find . -name '*.<suffix>' | sed 's/\/[^\/]*$//' | sort | uniq

# Snow at the terminal
clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'

# Convert *.avi to *.mp4
ffmpeg -y -i input_file.avi -s 432x320 -b:v 384k -vcodec libx264 -flags +loop+mv4 -cmp 256 -partitions +parti4x4+parti8x8+partp4x4+partp8x8 -subq 6 -trellis 0 -refs 5 -bf 0 -coder 0 -me_range 16 -g 250 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -qmin 10 -qmax 51 -qdiff 4 -c:a aac -ac 1 -ar 16000 -r 13 -ab 32000 -aspect 3:2 -strict -2 output_file.mp4

# Commit changes X days ago.
git commit --date="X day(s) ago" -m "MESSAGE"

# Open a two-way SSH tunnel for backwards connection from destination.
ssh -R $PORT_NUM:localhost:22 SERVER@IP
# On server command
ssh -p$PORT_NUM CLIENT@localhost

# Create background SSH connection to server. When physically on the server, you will be able to connect to the OG connection.
ssh -f -N -R $PORT_NUM:localhost:22 SERVER@IP
# On server command
ssh -p$PORT_NUM CLIENT@localhost
# Kill the SSH background process
pkill -f 'ssh -f -N -R $PORT_NUM:localhost:22 SERVER@IP'

# Take a screen shot of selected region, simulating `shift + print scr`, using ImageMagick
import NAME.png
import -window root NAME.png

# Copy from local machine to remote machine
scp localfile user@host:/path/to/whereyouwant/thefile
# Copy from remote machine to local machine
scp user@host:/path/to/remotefile localfile
