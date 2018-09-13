#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty

from LaunchRobot import LaunchRobot

from Table import Table

from MoveTo import MoveTo


def GetSide():
	side = 0
	if(rospy.has_param("~side")):
		side = rospy.get_param("~side")
	#print "side:"+str(side)
	return side 


def Sleep():
	rospy.sleep(0.1)

def Master():
	Sleep()

	move = MoveTo()

	rospy.init_node("node_master", anonymous=True)
	rospy.loginfo("[MASTER] BEGIN")
#	GetSide()

	Sleep()
	
	side = GetSide()

	rospy.sleep(5.)
	table = Table(side)
	rospy.loginfo("debranchement possible cote :  :"+str(side))

	Sleep()

	launch = LaunchRobot()

	Sleep()
	
	table.Parcours()
#	move.GoTo(2600, 800, 0)
	rospy.loginfo("[MASTER] END")

if __name__ == '__main__':
	try:
		#GetSide()
		Master()
	except rospy.ROSInterruptException:
		pass



	

