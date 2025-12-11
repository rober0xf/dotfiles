import requests
from bs4 import BeautifulSoup
import os
from dotenv import load_dotenv

load_dotenv()


COLORS = {
    "#FF0000": "red",
    "#FFA500": "orange",
    "#FFFF00": "yellow",
    "#32CD32": "green",
    "#66CCFF": "skyblue",
    "#0000FF": "blue",
    "#00008B": "darkblue",
}

RESET = "\033[0m"


def set_color(temp: int):
    if temp >= 31:
        return "#FF0000"
    elif temp >= 26:
        return "#FFA500"
    elif temp >= 20:
        return "#FFFF00"
    elif temp >= 15:
        return "#32CD32"
    elif temp >= 10:
        return "#66CCFF"
    elif temp >= 0:
        return "#0000FF"
    else:
        return "#00008B"


TRANSLATE = {
    "Tormenta": "Storm",
    "Lluvia": "Rain",
    "Parcialmente nuboso": "Partly Cloudy",
    "Nublado": "Overcast",
    "Despejado": "Clear",
    "Nevada": "Snow",
    "Nubes y claros": "Cloudy Intervals",
}

headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"}
url = os.getenv("URL")
if not url:
    print("URL is broken")
    exit(1)

resp = requests.get(url, headers=headers, timeout=10)
resp.raise_for_status()

soup = BeautifulSoup(resp.text, "html.parser")
temp_tag = soup.select_one("span.dato-temperatura.changeUnitT")
desc_tag = soup.select_one("span.descripcion")

if temp_tag and desc_tag:
    temp_str = temp_tag.get_text(strip=True).replace("°", "")
    temp = int(temp_str)
    descripcion = desc_tag.get_text(strip=True)

    color_hex = set_color(temp)
    color = COLORS[color_hex]

    desc = TRANSLATE.get(descripcion, descripcion)
    weather = f'{desc}: <span foreground="{color}">{temp}°</span>'
    print(weather)
