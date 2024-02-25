from revChatGPT.V3 import Chatbot
from os import remove
import requests

def discord_request():
    api_key = "<ChatGpt_api_key>"
    webhook_url = "Discord_webhook"
    bot_name = "ChatGPT"

    chatbot = Chatbot(api_key)
    mensaje = crear_mensaje()
    respuesta = chatbot.ask(mensaje)

    data = {
        "content": respuesta,
        "username": bot_name
    }
    requests.post(webhook_url, data=data)

def crear_mensaje():
    pregunta_portapapeles = ""
    prompt = ""
    
    with open("prompt.txt", "r", encoding='utf-8') as txt_prompt:
        for linea in txt_prompt:
            prompt += linea 

    with open("portapapeles", "r", encoding='utf-8') as txt:
        for linea in txt:
            pregunta_portapapeles += linea 
    
    remove("portapapeles")

    mensaje = prompt + pregunta_portapapeles

    return mensaje

