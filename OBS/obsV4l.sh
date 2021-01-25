#!/bin/bash
#
#  Activamos camara de Obs, para salida


sudo apt install v4l2loopback-dkms
sudo modprobe v4l2loopback devices=1 video_nr=10 card_label="OBS Cam" exclusive_caps=1


