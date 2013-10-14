#!/bin/bash

ls -d * | awk -F_ '{printf "mv %s %s;",$0,$1}' | sh
