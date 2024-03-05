#!/bin/bash

cd "$path"
clipboard_content=$(xclip -selection clipboard -o)
echo "$(pwd)"

if [[ $clipboard_content == prompt:* ]]; then
    prompt=$(echo "$clipboard_content" | sed 's/^prompt:"\([^"]*\)" \(.*\)/\1/')
    
    clipboard_content=$(echo "$clipboard_content" | sed 's/^prompt:"[^"]*" //')
    echo "$clipboard_content" > portapapeles
    
    python3 "$path/linux_clipboard.py" -p "$prompt"
else
    echo "$clipboard_content" > portapapeles
    
    python3 "$path/linux_clipboard.py"
fi
