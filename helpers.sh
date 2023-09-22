#!/bin/sh

# -- colors list
    # Black        0;30     Dark Gray     1;30
    # Red          0;31     Light Red     1;31
    # Green        0;32     Light Green   1;32
    # Brown/Orange 0;33     Yellow        1;33
    # Blue         0;34     Light Blue    1;34
    # Purple       0;35     Light Purple  1;35
    # Cyan         0;36     Light Cyan    1;36
    # Light Gray   0;37     White         1;37
    #
    RED='\033[0;31m'
    BOLD_RED='\033[1;31m'
    GREEN='\033[0;32m'
    BOLD_GREEN='\033[1;32m'
    BLUE='\033[0;34m'
    BOLD_BLUE='\033[1;34m'
    YELLOW='\033[0;33m'
    BOLD_YELLOW='\033[1;33m'
    NC='\033[0m' # No Color
    # Usage: printf "I ${RED}love${NC} Stack Overflow\n"
    # in echo use -e to allow \escape
    # link: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

    # printf "I ${RED}love${NC} Stack Overflow\n"
# -- end colors list

# Outputs current time as a string in the format: YYYYMMDDHHMMSS
timestamp() {
  date +"%Y%m%d%H%M%S"
}

# Writes a log message to stdout using colors
# @param { string } type    - the type of log message [ok, err, info, warn]
# @param { string } message - the message to output
#
log() {
    TYPE="$1"
    MSG="$2"

    case "$TYPE" in 
        "ok"   ) printf "[${BOLD_GREEN}   OK  ${NC}]: %s \n" "$MSG";;
        "info" ) printf "[${BOLD_BLUE}  INFO ${NC}]: %s \n" "$MSG";;
        "warn" ) printf "[${BOLD_YELLOW}WARNING${NC}]: %s \n" "$MSG";;
        # default = error
        * ) printf "[${BOLD_RED} ERROR ${NC}]: %s \n" "$MSG" 
    esac 
}