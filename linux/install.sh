#!/bin/bash

path=$(pwd)
echo "[+] Configurando..."
echo "[-] Instalando xbindkeys..."
sudo apt install xbindkeys -y &> /dev/null
pip3 install revChatGPT
pip3 install requests
pip3 install pyperclip
source $HOME/.bashrc
xbindkeys --defaults > $HOME/.xbindkeysrc
echo "# ChatGPT Api bind key" >> $HOME/.xbindkeysrc
echo '"bash '$path'/main.sh"' >> $HOME/.xbindkeysrc
echo "   Control + Alt + 0" >> $HOME/.xbindkeysrc
killall -s1 xbindkeys
sed -i '2i\path='"$path" main.sh

printf "\e[32m%s\e[0m" "[*] Enter your ChatGpt api key: "
read api_key

sed -i "s/api_key = \"\"/api_key = \"$api_key\"/" linux_clipboard.py
echo -e "\n"

echo -e "\e[33m\t[-] The program is enabled in the startup\e[0m"
echo -e "\e[33m\t[-] Copy any text and press Ctrl + Alt + 0 to ask ChatGpt\e[0m"
echo -e "\e[33m\t[-] In a few seconds, you will have the answer in your clipboard\e[0m"
echo -e "\n"

echo "[+] Done"


