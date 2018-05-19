# This is a list of useful commands that have aided me throughout my hacking

*Every command is a useful command if it ends in `rm -rf /`*

---

## GENERAL COMMANDS

``` bash
# Export .md to .pdf
pandoc --latex-engine=xelatex --wrap=auto -p --highlight-style=kate -V mainfont="Times New Roman" -V fontsize=12pt -V geometry:margin=1in -V documentclass=article -V linestrech=1.5 -V colorlinks -V link-as-notes SRC.md -s -o DEST.pdf

# Search for suffix type files, but only print the paths to directories that contain them.
find . -name '*.<suffix>' | sed 's/\/[^\/]*$//' | sort | uniq


# Snow at the terminal
clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'

# Convert *.avi to *.mp4
ffmpeg -y -i input_file.avi -s 432x320 -b:v 384k -vcodec libx264 -flags +loop+mv4 -cmp 256 -partitions +parti4x4+parti8x8+partp4x4+partp8x8 -subq 6 -trellis 0 -refs 5 -bf 0 -coder 0 -me_range 16 -g 250 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -qmin 10 -qmax 51 -qdiff 4 -c:a aac -ac 1 -ar 16000 -r 13 -ab 32000 -aspect 3:2 -strict -2 output_file.mp4

# Take a screen shot of selected region, simulating `shift + print scr`, using ImageMagick
import NAME.png
import -window root NAME.png

# Use -k to search for something in all man pages, like 'sound'
man -k sound

# Restart `pulseaudio` and `ALSA`
pulseaudio -k && sudo alsa force-reload

# Compton setup for general use
compton --shadow --clear-shadow --shadow-opacity=0.75 --shadow-radius108 --shadow-red 0.105 --shadow-green 0.392 --shadow-blue 0.611 --daemon --fading --fade-in-step=0.08 --fade-out-step=0.08 --inactive-opacity=0.7 --shadow-exclude 'class_g = "Polybar"' --shadow-exclude 'class_g = "Firefox"' --focus-exclude 'class_g = "Firefox"' --focus-exclude 'class_g = "Rofi"' --shadow-exclude '!focused'

# Checl the ASCII table for character encoding
ascii -x || man ascii

# Check SHA1 of a downloaded file
sha1sum $FILE

# List all block devices with paths, size, and permissions
lsblk --all --bytes --fs --perms

# Create a bootable USB image
sudo umount /dev/sd<?><?>
sudo dd bs=4M if=/path/to/image.iso of=/dev/sd<?> conv=fdatasync
```

---

## Git

``` bash
# Commit changes X days ago.
git commit --date="X day(s) ago" -m "MESSAGE"

# Set git to push towards URL no_push (disable git push)
git remote set-url --push origin no_push
```

---

## SSH / SCP

``` bash
# Open a two-way SSH tunnel for backwards connection from destination.
ssh -R $PORT_NUM:localhost:22 SERVER@IP
# On server command
ssh -p $PORT_NUM CLIENT@localhost

# Create background SSH connection to server. When physically on the server, you will be able to connect to the OG connection.
ssh -f -N -R $PORT_NUM:localhost:22 SERVER@IP
# On server command
ssh -p $PORT_NUM CLIENT@localhost
# Kill the SSH background process
pkill -f 'ssh -f -N -R $PORT_NUM:localhost:22 SERVER@IP'

# Copy from local machine to remote machine
scp -p $PORT localfile user@host:/path/to/whereyouwant/thefile
# Copy from remote machine to local machine
scp -p $PORT user@host:/path/to/remotefile localfile
```

---

## ZFS

``` bash
# Create a backup from a snapshot into .raw
sudo zfs send lxd/main/containers/CONTAINER@snapshot-CONTAINER-snap$(date +%Y%m%d) > ~/CONTAINER.raw

# Create a backup from a snapshot into .raw AND send it to another place over ssh
zfs send

# Restore from a backup
zfs receive
```
