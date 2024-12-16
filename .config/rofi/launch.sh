#!/bin/bash

# Kill any running instance of rofi
killall rofi

# Launch rofi with the arguments passed to this script
rofi "$@"
