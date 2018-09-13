#!/usr/bin/env python

import RPi.GPIO as GPIO
import rospy

from std_msgs.msg import Empty

def LaunchRobot():
	PIN = 21

	GPIO.setmode(GPIO.BCM)
	GPIO.setup(PIN, GPIO.IN, pull_up_down=GPIO.PUD_UP)

	input_state = False

	while not input_state:
		input_state = GPIO.input(PIN)

		if input_state:
			break
