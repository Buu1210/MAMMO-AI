"""Paso 1 del issue #1: comprobar que la conexion con Gemini funciona.

Esto solo envia un solo mensaje y muestra la respuesta. No es un chatbot.
"""
import os
from pathlib import Path

from dotenv import load_dotenv
from google import genai

# Carga las variables del archivo .env que esta junto a este script.
load_dotenv(Path(__file__).parent / ".env")

clave = os.getenv("GEMINI_API_KEY")
modelo = os.getenv("GEMINI_MODEL", "gemini-3.5-flash")

if not clave or clave == "ERROR_NO_EXISTE_CLAVE_API":
    raise SystemExit("Falta la clave. Revisa el archivo .env.")

cliente = genai.Client(api_key=clave)

print(f"Enviando mensaje de prueba al modelo {modelo}...")
respuesta = cliente.interactions.create(
    model=modelo,
    input="Responde en una sola frase: ¿estás funcionando?",
)
print("Respuesta de Gemini:", respuesta.output_text)
