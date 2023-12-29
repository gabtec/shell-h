#!/bin/sh

source ./lib/helpers.sh

# test timestamp()
timestamp

# test log()
log ok success
log info info
log warn warning
log err error
log danger danger
log del deleting
log pass Test Pass
log fail Test Fail

printc red vermelho
printc blue azul
printc yellow amarelo
printc green verde
printc black preto

print_banner "Demo Banner Large"
print_banner "Demo Banner Large" 150