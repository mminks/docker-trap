#!/usr/bin/env bash

die()
{
    bash /run_trap_code.sh

    exit 0
}

trap die TERM

while true
do
    sleep 1
done
