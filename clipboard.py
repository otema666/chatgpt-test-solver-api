import main

def procesar_archivo(entrada, salida):
    with open(entrada, 'r', encoding='utf-8', errors='ignore') as f:
        lineas = f.readlines()

    with open(salida, 'w', encoding='utf-8') as f:
        ultima_linea_salto = False
        num_saltos_consecutivos = 0

        for linea in lineas:
            if linea.strip():
                f.write(linea)
                num_saltos_consecutivos = 0
                ultima_linea_salto = False
            else:
                num_saltos_consecutivos += 1
                if num_saltos_consecutivos == 2:
                    f.write('\n')
                elif num_saltos_consecutivos > 2:
                    continue
                else:
                    if ultima_linea_salto:
                        f.write('\n')

                ultima_linea_salto = True

procesar_archivo('portapapeles', 'portapapeles')

main.discord_request()