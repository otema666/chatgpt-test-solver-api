from revChatGPT.V3 import Chatbot
from os import remove
import pyperclip
import argparse

def chatgpt_request(prompt):
    api_key = ""

    chatbot = Chatbot(api_key)
    mensaje = crear_mensaje(prompt)
    respuesta = chatbot.ask(mensaje)
    
    pyperclip.copy(respuesta)

def crear_mensaje(prompt):
    pregunta_portapapeles = ""
    
    with open("portapapeles", "r", encoding='utf-8') as txt:
        for linea in txt:
            pregunta_portapapeles += linea 
    
    remove("portapapeles")

    mensaje = prompt + pregunta_portapapeles

    return mensaje

def main():
    parser = argparse.ArgumentParser(description="ChatGPT")
    parser.add_argument("-p", "--prompt", type=str, help="Specify the prompt")
    args = parser.parse_args()

    if args.prompt:
        prompt = args.prompt
    else:
        with open("../prompt.txt", "r", encoding='utf-8') as txt_prompt:
            prompt = ""
            for linea in txt_prompt:
                prompt += linea 

    pyperclip.copy("espera")
    chatgpt_request(prompt)

if __name__ == "__main__":
    main()