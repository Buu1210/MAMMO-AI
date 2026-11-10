"""Diagnostico temporal de la conexion con Gemini (se puede borrar despues).

No usa la libreria de Google: llama directo a la API con un tiempo limite,
para ver el error real en vez de quedarse esperando.
"""
import json
import os
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

from dotenv import load_dotenv

load_dotenv(Path(__file__).parent / ".env")
clave = os.getenv("GEMINI_API_KEY", "")
modelo = os.getenv("GEMINI_MODEL", "gemini-3.5-flash")
BASE = "https://generativelanguage.googleapis.com/v1beta"


def llamar(url, cuerpo=None):
    datos = json.dumps(cuerpo).encode() if cuerpo else None
    req = urllib.request.Request(url, data=datos, headers={
        "x-goog-api-key": clave, "Content-Type": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=90) as r:
            return r.status, json.load(r)
    except urllib.error.HTTPError as e:
        return e.code, json.loads(e.read() or b"{}")
    except Exception as e:
        return None, {"error": {"message": f"{type(e).__name__}: {e}"}}


# Uso: python diagnostico.py                -> lista modelos y prueba el del .env
#      python diagnostico.py modelo1 modelo2 -> prueba solo esos modelos
modelos = sys.argv[1:]
if not modelos:
    modelos = [modelo]
    print("1) Modelos 'flash' disponibles para tu clave...")
    codigo, datos = llamar(f"{BASE}/models?pageSize=200")
    if codigo == 200:
        for m in datos.get("models", []):
            if "flash" in m["name"]:
                print("   ", m["name"].split("/")[1])
    else:
        print("    Error", codigo, datos.get("error", {}).get("message"))
    print()

for m in modelos:
    print(f"Probando {m} (maximo 90 segundos)...")
    inicio = time.time()
    codigo, datos = llamar(f"{BASE}/models/{m}:generateContent",
                           {"contents": [{"parts": [{"text": "Di hola en una frase."}]}]})
    seg = time.time() - inicio
    if codigo == 200:
        print(f"    OK en {seg:.1f} s:", datos["candidates"][0]["content"]["parts"][0]["text"].strip())
    else:
        err = datos.get("error", {})
        print(f"    Error tras {seg:.1f} s:", codigo, err.get("status"), "-", err.get("message"))
