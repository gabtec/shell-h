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
    BLACK='\033[0;30m'
    NC='\033[0m' # No Color
    # Usage: printf "I ${RED}love${NC} Stack Overflow\n"
    # in echo use -e to allow \escape
    # link: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

    # printf "I ${RED}love${NC} Stack Overflow\n"
# -- end colors list

# =====================================================================================================
# Outputs current time as a string in the format: YYYYMMDDHHMMSS
timestamp() {
  date +"%Y%m%d%H%M%S"
}

# =====================================================================================================
# Writes a log message to stdout using colors
# @param { string } type    - the type of log message [ok, err, info, warn]
# @param { string } message - the message to output
#
log() {
    TYPE="$1"
    MSG="$2"

    case "$TYPE" in 
        "ok"   ) printf "[${BOLD_GREEN}   OK  ${NC}]: %s \n" "$MSG";;
        "pass"   ) printf "[${BOLD_GREEN}  PASS ${NC}]: %s \n" "$MSG";;
        "info" ) printf "[${BOLD_BLUE}  INFO ${NC}]: %s \n" "$MSG";;
        "warn" ) printf "[${BOLD_YELLOW}WARNING${NC}]: %s \n" "$MSG";;
        "danger" ) printf "[${BOLD_RED} DANGER${NC}]: %s \n" "$MSG";;
        "fail" ) printf "[${BOLD_RED}  FAIL ${NC}]: %s \n" "$MSG";;
        "del" ) printf "[${BOLD_RED}  DEL  ${NC}]: %s \n" "$MSG";;
        # default = error
        * ) printf "[${BOLD_RED} ERROR ${NC}]: %s \n" "$MSG" 
    esac 
}

# =====================================================================================================
# Writes a color message to stdout
# @param { string } color   - the text color [red, green, yellow, etc]
# @param { string } message - the message to output
#
printc() {
    COLOR="$1"
    MSG="$2"

    case "$COLOR" in 
        "green"   ) printf "${BOLD_GREEN}%s${NC}\n" "$MSG";;
        "blue" ) printf "${BOLD_BLUE}%s${NC}\n" "$MSG";;
        "yellow" ) printf "${BOLD_YELLOW}%s${NC}\n" "$MSG";;
        "red" ) printf "${BOLD_RED}%s${NC}\n" "$MSG";;
        # default = black
        * ) printf "${BLACK}%s${NC}\n" "$MSG" 
    esac 
}
# =====================================================================================================
declare -i TERM_DEFAULT_SIZE=80
# Prints an ASCII Art Message Banner
# OR, in case figlet is not available,
# just a simple info message
# @param { string } message - the message to output
# @param { int } terminal width - the width available to print banner without new line
print_banner() {
    MSG="$1"

    # check 2nd arg exists
    if [ ! -z $2 ]; then
        # if exists and if bigger then default, replace
        if [ $2 -gt $TERM_DEFAULT_SIZE ]; then  
            TERM_DEFAULT_SIZE=$2
        fi
    fi

    if [ ! -z $(which figlet) ]; then
        figlet -w "$TERM_DEFAULT_SIZE" -k "$1"
        printf %"$TERM_DEFAULT_SIZE"s | tr " " "-"
        echo ""
    else 
        echo " --------- $1 ---------"
        echo ""
    fi 
}

# =====================================================================================================
# -------------------------------------------------- #
# Checks if a list of required applications,
# are already installed on your system.
#
# Parameters:
#   - { Array } - the list of app names tpo check
# Returns:
#   - exit 0, if any not found
#   - do nothing, if all found
# -------------------------------------------------- #
function h_check_requirements() {
  list="$1"
  
  for it in "${list[@]}"; do
    # do your logic
    isFound=$(which $it)

    if [[ "$?" -ne 0 ]]; then
      log err "$it is not installed"
      exit 4
    fi
  done
}
# =====================================================================================================