
#!/usr/bin/env python

import rospy

from std_msgs.msg import Empty

from robot2.msg import Pose2DOrient


class MoveTo():
	def __init__(self):
		self.pub_move = rospy.Publisher("topic_master_move", Pose2DOrient, queue_size = 10)

	def GoTo(self, x, y, theta):
		mv = Pose2DOrient()
		mv.x = x
		mv.y = y
		mv.theta = theta

		rospy.loginfo("[MOVE] demande de deplacement")
		self.pub_move.publish(mv)

        	#wait callback from topic_move_master
		rospy.wait_for_message("topic_move_master", Empty)

		rospy.loginfo("[MOVE] deplacement fini")








