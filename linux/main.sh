#!/bin/bash

cd $path
clipboard_content=$(xclip -selection clipboard -o)
echo "$(pwd)"

echo "$clipboard_content" > portapapeles

python3 $path/linux_clipboard.py


