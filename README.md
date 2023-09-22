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

