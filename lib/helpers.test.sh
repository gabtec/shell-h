#!/bin/sh

source ./lib/helpers.sh

# test timestamp()
timestamp

# test log()
log ok success
log info info
log warn warning
log err error

print_banner "Demo Banner Large"
print_banner "Demo Banner Large" 150