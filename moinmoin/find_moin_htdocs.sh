#!/bin/sh
# queries installed package moinmoin and return
# path to stdout
#
# "pkg query %Fp [name]" returns list of files within an installed package
# "pkg info -l [name]" too ;-)
# 
dirname `pkg info -l moinmoin | grep "htdocs/index.html"`
