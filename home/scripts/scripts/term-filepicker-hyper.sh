#!/usr/bin/env bash

TMPFILE=$(mktemp)
CMD="[float; center 1; size 50% 50%] echo \$$ > $TMPFILE; exec kitty -e yazi --chooser-file='$1'"
hyprctl -q dispatch exec "$CMD"
sleep 1
waitpid "$(cat $TMPFILE)" 2>/dev/null
rm "$TMPFILE"
