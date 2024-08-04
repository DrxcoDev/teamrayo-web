import discord
import logging

# Configuración del logging para capturar mensajes de depuración
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Configuración del cliente de Discord
intents = discord.Intents.default()
intents.message_content = True
client = discord.Client(intents=intents)

# ID del canal al que enviar los mensajes de depuración
CHANNEL_ID = 123456789012345678  # Reemplaza con el ID del canal
TOKEN = 'TU_TOKEN_DEL_BOT'  # Reemplaza con el token de tu bot

@client.event
async def on_ready():
    print('Bot está listo!')
    # Enviar un mensaje de inicio al canal
    channel = client.get_channel(CHANNEL_ID)
    if channel:
        await channel.send('Bot iniciado y listo para recibir mensajes.')
    else:
        print('Canal no encontrado.')

@client.event
async def on_message(message):
    if message.author == client.user:
        return

    # Imprimir los mensajes en el canal
    channel = client.get_channel(CHANNEL_ID)
    if channel:
        await channel.send(f'Mensaje recibido: {message.content}')
    else:
        print('Canal no encontrado.')

@client.event
async def on_error(event, *args, **kwargs):
    # Captura errores globales y envíalos al canal
    channel = client.get_channel(CHANNEL_ID)
    if channel:
        await channel.send(f'Error no capturado: {str(args[0])}')
    else:
        print('Canal no encontrado.')

# Inicia el bot
client.run(TOKEN)
