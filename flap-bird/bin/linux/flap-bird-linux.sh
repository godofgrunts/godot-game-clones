#!/bin/sh
echo -ne '\033c\033]0;flap-bird\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/flap-bird-linux.x86_64" "$@"
