import RPi.GPIO as GPIO
import time
import os

SHUTDOWN_PIN = 21

GPIO.setmode(GPIO.BCM)
GPIO.setup(SHUTDOWN_PIN, GPIO.IN, pull_up_down=GPIO.PUD_UP)

try:
    GPIO.wait_for_edge(SHUTDOWN_PIN, GPIO.FALLING)
    os.system("sudo shutdown now")
except:
    pass
