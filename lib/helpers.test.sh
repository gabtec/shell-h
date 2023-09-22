#!/bin/sh

source ./helpers.sh

# test timestamp()
timestamp

# test log()
log ok success
log info info
log warn warning
log err error
