#!usr/bin/env python-

import rospy
from std_msgs.msg import Int32

from MoveTo import MoveTo
from Balls import Balls

class Table:
	def __init__(self, cote):
		#1 = cote gauche / 0 = cote droit
		self.cote = Int32()
		self.cote.data = cote
		self.pub_cote = rospy.Publisher("topic_master_cote", Int32, queue_size = 10)
		rospy.sleep(0.5)
		self.pub_cote.publish(self.cote)

		self.move = MoveTo()
		self.ball = Balls()

		rospy.sleep(0.5)

	def Parcours(self):
		#self.CollectBalls1()
		self.Abeille()
		#self.VideBalls1()
		#self.CollectBalls2()
		#self.VideBalls2()
		

	def CollectBalls1(self):
		if self.cote.data == 0:
			rospy.loginfo("[BALLS] Collect balls cote droit depart")
			rospy.sleep(0.1)
			self.move.GoTo(2735, 680, 180)
			rospy.sleep(0.1)
			rospy.loginfo("[BALLS] Collect balls cote droit depart")
			
		if self.cote.data == 1:
			rospy.loginfo("[BALLS] Collect balls cote gauche depart")
			rospy.sleep(0.1)
			self.move.GoTo(300, 680, 0)
			rospy.sleep(0.1)
			rospy.loginfo("[BALLS] Collect balls cote gauche fini")

	def CollectBalls2(self):
		if self.cote.data == 0:
			rospy.loginfo("[BALLS] Collect balls cote droit depart")
			rospy.sleep(0.1)
			self.move.GoTo(2400, 700, 90)
			rospy.sleep(0.1)
			self.move.GoTo(2400, 250, 90)
			rospy.sleep(0.1)
			self.move.GoTo(2400, 250, -90)
			rospy.sleep(0.1)
			rospy.loginfo("[BALLS] Collect balls cote droit depart")
			
		if self.cote.data == 1:
			rospy.loginfo("[BALLS] Collect balls cote gauche depart")
			rospy.sleep(0.1)
			self.move.GoTo(220, 870, 0)
			rospy.sleep(0.1)
			
			rospy.loginfo("[BALLS] Collect balls cote gauche fini")

	def VideBalls1(self):
		if self.cote.data == 0:
			rospy.loginfo("[BALLS] Vide balls cote droit depart")
			rospy.sleep(0.1)
			self.move.GoTo(250, 100, - 90)
			rospy.sleep(0.1)
			self.move.GoTo(600, 500, 0)
			rospy.sleep(0.1)
			self.move.GoTo(1750, 400, 90)
			rospy.sleep(0.1)
			rospy.loginfo("[BALLS] Vide balls cote droit depart")

		if self.cote.data == 1:
			rospy.loginfo("[BALLS] Vide balls cote droit depart")
			rospy.sleep(0.1)
			self.move.GoTo(2400, 700, -90)
			rospy.sleep(0.1)
			self.move.GoTo(2400, 250, 90)
			rospy.sleep(0.1)
			rospy.loginfo("[BALLS] Vide balls cote droit depart")

	def VideBalls2(self):
		if self.cote.data == 0:
			rospy.loginfo("[BALLS] Vide balls cote droit depart")
			rospy.sleep(0.1)
			self.move.GoTo(2400, 700, 90)
			rospy.sleep(0.1)
			self.move.GoTo(1750, 400, 90)
			rospy.sleep(0.1)
			rospy.loginfo("[BALLS] Vide balls cote droit depart")

		if self.cote.data == 1:
			rospy.loginfo("[BALLS] Vide balls cote droit depart")
			rospy.sleep(0.1)
			self.move.GoTo(2400, 700, -90)
			rospy.sleep(0.1)
			self.move.GoTo(1750, 400, 90)
			rospy.sleep(0.1)
			rospy.loginfo("[BALLS] Vide balls cote droit depart")
			
	def Abeille(self):
		if self.cote.data == 0:
			rospy.loginfo("[ABEILLE] Depart activer l'abeille")
			rospy.sleep(0.1)

			#evitement cubes debut
			rospy.sleep(0.1)
			self.move.GoTo(2300, 950, 90)
			rospy.sleep(0.1)
			#self.move.GoTo(2400, 1550, 90)
			rospy.sleep(0.1)
			self.move.GoTo(2400, 1830, 0)
			rospy.sleep(0.1)
			self.ball.Ouvrir()
			rospy.sleep(2.)
			self.move.GoTo(2700, 1970, -80)
			rospy.sleep(0.1)
			self.ball.Fermer()
			#evitement cubes fin

		if self.cote.data == 1:
			rospy.sleep(0.1)
			self.move.GoTo(700, 950, 90)
			rospy.sleep(0.1)
			#self.ball.Request()
			rospy.sleep(0.1)
			self.move.GoTo(120, 1890, -80)
			rospy.sleep(0.1)
			self.ball.Request()


 
