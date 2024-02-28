from revChatGPT.V3 import Chatbot
from os import remove
import pyperclip

def chatgpt_request():
    api_key = ""

    chatbot = Chatbot(api_key)
    mensaje = crear_mensaje()
    respuesta = chatbot.ask(mensaje)
    
    pyperclip.copy(respuesta)

def crear_mensaje():
    pregunta_portapapeles = ""
    prompt = ""
    
    with open("../prompt.txt", "r", encoding='utf-8') as txt_prompt:
        for linea in txt_prompt:
            prompt += linea 

    with open("portapapeles", "r", encoding='utf-8') as txt:
        for linea in txt:
            pregunta_portapapeles += linea 
    
    remove("portapapeles")

    mensaje = prompt + pregunta_portapapeles

    return mensaje

pyperclip.copy("espera....")
chatgpt_request()

