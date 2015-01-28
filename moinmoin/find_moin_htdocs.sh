#!/bin/sh
# queries installed package moinmoin and return
# path to stdout
#
# "pkg query %Fp [name]" returns list of files within an installed package
# 
dirname `pkg query %Fp moinmoin | grep "htdocs/index.html"`
