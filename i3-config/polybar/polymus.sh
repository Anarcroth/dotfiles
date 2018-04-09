#!/bin/bash

prepend_0 () {
    seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep artist -m 1 | cut -c 12-))
song=$(echo -n $(cmus-remote -C status | grep title -m -1 | cut -c 11-))

position=$(cmus-remote -C status | grep position | cut -c 10-)
if [ "$position" != "" ]; then
    minutes1=$(prepend_0 $(( $position / 60 )))
    seconds1=$(prepend_0 $(( $position % 60 )))

    duration=$(cmus-remote -C status | grep duration | cut -c 10-)
    minutes2=$(prepend_0 $(( $duration / 60 )))
    seconds2=$(prepend_0 $(( $duration % 60 )))
fi

status=$(echo -n $(cmus-remote -C status | grep status -m 1 | cut -c 8-))

if [ "$status" == "playing" ]; then
    echo -n "$artist - $song > $minutes1:$seconds1 - $minutes2:$seconds2"
else
    echo -n "$artist - $song | $minutes1:$seconds1 - $minutes2:$seconds2"
fi
