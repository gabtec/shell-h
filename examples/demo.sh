#!/bin/sh

# -------------------------------------------------#
#  This is an example on how you can use
#  direct import
#  -------------
#  NOTE: if no internet connection, it won't work
# -------------------------------------------------#

# you may also find source represented as a single dot "."
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/gabtec/shell-h/main/lib/helpers.sh)"

# 
log ok "this is my message with $(timestamp)"