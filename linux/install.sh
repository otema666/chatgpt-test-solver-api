#!/bin/bash

path=$(pwd)
echo "[+] Configurando..."
sudo apt install xbindkeys &> /dev/null
xbindkeys --defaults > $HOME/.xbindkeysrc
echo "# ChatGPT Api bind key" >> $HOME/.xbindkeysrc
echo '"bash '$path'/main.sh"' >> $HOME/.xbindkeysrc
echo "   Control + Alt + 0" >> $HOME/.xbindkeysrc
killall -s1 xbindkeys
sed -i '2i\path='"$path" main.sh
read -p "Enter your ChatGpt api key: " api_key

sed -i "s/api_key = \"\"/api_key = \"$api_key\"/" linux_clipboard.py
echo "[+] Done"
