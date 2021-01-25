#####################################################################
#
#  Script para levantar dispositivos necesarios para OBS-ZOOM y Otros
#
#####################################################################

# Crea un dispositivo de Salida nulo para disponer de monitorizacion de salida
# Crea Salida-SonidoOBS y su monitor AudioOBS.monitor
#  Esta es la salida que debemos poner en el monitor de OBS
pactl load-module module-null-sink sink_name=AudioOBS sink_properties=device.description=Salida-SonidoOBS

# Creamos Monitor de Entrada de AudioOBS(Nulo Salida), para asignarla a los programas
#  Crea OBS-Virtual-Sonido    del monitor AudioOBS.monitor
#  Este es el dispositivo que pondremos como Microfono en Zoom o el programa de conferencia que tengamos.
pactl load-module module-remap-source source_name=VirtualAudioOBS master=AudioOBS.monitor source_properties=device.description=OBS-Virtual-Sonido

