#!/bin/bash
#
#  Script para configurar camaras
#
#  www.pinguytaz.net
#############################################################


#lsusb  Ver camaras conectadas
### Bus 001 Device 005: ID 05c8:0382 Cheng Uei Precision Industry Co., Ltd (Foxlink) HP Truevision HD
### Bus 001 Device 008: ID 05e1:0408 Syntek Semiconductor Co., Ltd STK1160 Video Capture Device
### Bus 001 Device 009: ID 8086:0110 Intel Corp. Easy PC Camera


PS3="Seleccionar camara: "
camaras="Prixton_C1000 OBS_Cam EasyCam"
select camara in ${camaras} Salir
do
   #if [ "${camara}" = "Salir" ] ; then exit fi
   case $camara in
      Salir)
         break
         ;;
      Prixton_C1000)
         modulo=stk1160
	 echo "Configuramos camara $modulo"
         sudo modprobe -r $modulo
         sudo modprobe $modulo
	 sleep 10   #Espera configuracion
	 v4l2-ctl --device /dev/video2 --set-fmt-video=width=1280,height=720,pixelformat=UYVY
	 v4l2-ctl --device /dev/video2 --set-standard=0x000000ff
	 v4l2-ctl --device /dev/video2 --get-standard
	 v4l2-ctl --list-devices
         ### mplayer tv:// -tv driver=v4l2:device=/dev/video2
         ;;
      OBS_Cam)
         echo "Configuracion camara de salida de OBS (v4l2loopback)"
	 ##### sudo apt install v4l2loopback-dkms
         sudo modprobe v4l2loopback devices=1 video_nr=9 card_label="OBS Cam" exclusive_caps=1
	 ##### ffmpeg -i /dev/video9 -f v4l2 -pix_fmt yuv420p /dev/video5

         ;;
      EasyCam)
         modulo=spca508
         echo "Configuracion camara $modulo"
         ;;
      *)
         echo "$REPLY opción no configurada"
         ;;
   esac
 #read -p "Escribe el primer número: " n1
done


#mplayer tv:// -tv driver=v4l2:device=/dev/video2

