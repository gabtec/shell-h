# shell-h

A set of helpers functions, to create shell scripts

## Dependencies

- none

## Usage

Include this in your script:

```sh
# OPTION 1: manually download the helpers.sh file,
#   then import it in your scripts
source helpers.sh

# OPTION 2: automatically download it using curl
curl -s https://raw.githubusercontent.com/gabtec/shell-h/main/lib/helpers.sh > helpers.sh
# then import it
source helpers.sh

# OPTION 3: direct load into source - no file save
# you may also find source represented as a single dot "."
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/gabtec/shell-h/main/lib/helpers.sh)"

```

## :book: HELPERS List

This file exposes some useful functions:

### Usage:

The exposed functions are:

#### log()

Outputs a color log message.

Example:

```sh
# usage: log TYPE MESSAGE
# TYPE options are: ok | info | warn | err
log ok "some success message"
# result example: [  OK  ]: some sucess message
```

#### timestamp()

Outputs the current date in YYYYMMDDHHMMSS format.

Example:

```sh
# usage: timestamp
timestamp
# result example: 20230922231044
```

#### print_banner()

Prints the provided message, as a banner
If availabkle it uses Figlet ASCII Art lib

Example:

```sh
# usage: print_banner "some message"
print_banner "Demo Banner" 86
# --------- Demo Banner ---------
# or
#  ____                            ____
# |  _ \   ___  _ __ ___    ___   | __ )   __ _  _ __   _ __    ___  _ __
# | | | | / _ \| '_ ` _ \  / _ \  |  _ \  / _` || '_ \ | '_ \  / _ \| '__|
# | |_| ||  __/| | | | | || (_) | | |_) || (_| || | | || | | ||  __/| |
# |____/  \___||_| |_| |_| \___/  |____/  \__,_||_| |_||_| |_| \___||_|
#
```

#### h_check_requirements()

Checks if a provided list of packages, are installed on the system

Example:

```sh
requires=("gh" "op" "xxp")
h_check_requirements "${requires[@]}"
```
