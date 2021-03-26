#!/bin/sh

symbol="$1"

if [ -z "$symbol" ]; then
    symbol="//"
fi

sed -E "s|^|$symbol|"
