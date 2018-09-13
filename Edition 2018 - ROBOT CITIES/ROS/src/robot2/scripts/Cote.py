#!/usr/bin/env python

import RPi.GPIO as GPIO
import rospy

from std_msgs.msg import Int32

def Cote():
	PIN = 13

	pub_cote = rospy.Publisher("topic_master_cote", Int32, queue_size = 10)

	GPIO.setmode(GPIO.BCM)
	GPIO.setup(PIN, GPIO.IN, pull_up_down=GPIO.PUD_UP)

	input_state = GPIO.input(PIN)

	state = Int32()

	if input_state:
		rospy.loginfo("[COTE] Gauche")
		state.data = 1
		pub_cote.publish(state)
	else:
		rospy.loginfo("[COTE] droit")
		state.date=0
		pub_cote.publish(state)
