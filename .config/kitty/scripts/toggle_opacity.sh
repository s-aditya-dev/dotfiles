#!/bin/bash

# File to store current opacity state
STATE_FILE="/tmp/kitty_opacity_state"

# Default opacity values
OPAQUE=1.0
TRANSPARENT=0.8

# Read the current state or default to OPAQUE
if [[ -f "$STATE_FILE" ]]; then
	CURRENT_OPACITY=$(cat "$STATE_FILE")
else
	CURRENT_OPACITY=$OPAQUE
fi

# Toggle opacity
if [[ "$CURRENT_OPACITY" == "$OPAQUE" ]]; then
	NEW_OPACITY=$TRANSPARENT
else
	NEW_OPACITY=$OPAQUE
fi

# Apply the new opacity and save the state
kitty @ set-background-opacity $NEW_OPACITY
echo $NEW_OPACITY >"$STATE_FILE"
