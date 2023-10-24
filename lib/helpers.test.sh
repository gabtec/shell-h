#!/bin/sh

source ./lib/helpers.sh

# test timestamp()
timestamp

# test log()
log ok success
log info info
log warn warning
log err error

printc red vermelho
printc blue azul
printc yellow amarelo
printc green verde
printc black preto

print_banner "Demo Banner Large"
print_banner "Demo Banner Large" 150