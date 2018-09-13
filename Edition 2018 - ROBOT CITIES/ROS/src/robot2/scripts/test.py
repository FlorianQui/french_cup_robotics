#!/usr/bin/env python

import rospy
from MoveTo import MoveTo
from Balls import Balls

from robot2.msg import Pose2DOrient
from std_msgs.msg import Empty

from Cote import Cote

move = MoveTo()
ball = Balls()

rospy.init_node("test_node", anonymous=True)

move.GoTo(2700, 400, 180)

