#!/usr/bin/env python

import rospy

from std_msgs.msg import Empty
from std_msgs.msg import Int32
from robot2.msg import Pose2DOrient

class Balls():

	def __init__(self):
		self.pub_balls = rospy.Publisher("topic_master_balls", Int32, queue_size = 10)

	def Ouvrir(self):
		rospy.loginfo("[BALLS] Ouverture trappe")
        	#pub (servo) to topic_master_move
		req = Int32()
		req.data = 0
		self.pub_balls.publish(req)

		#wait callback from topic_move_master
		rospy.wait_for_message("topic_balls_master", Empty)

	def Fermer(self):
		rospy.loginfo("[BALLS] Fermeture trappe")
		ferm = Int32()
		ferm.data = 1
		self.pub_balls.publish(ferm)

		rospy.wait_for_message("topic_balls_master", Empty)
		rospy.loginfo("ok")
