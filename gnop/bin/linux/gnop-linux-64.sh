#!/bin/sh
echo -ne '\033c\033]0;gnop\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/gnop-linux-64.x86_64" "$@"
