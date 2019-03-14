#!/bin/bash

shopt -s dotglob
for f in home/*; do
    if [[ -f "$f" ]]; then
        shellcheck "$f"
    elif [[ -d "$f" ]]; then
        shellcheck "$f/*sh"
    fi
done
shopt -u dotglob

