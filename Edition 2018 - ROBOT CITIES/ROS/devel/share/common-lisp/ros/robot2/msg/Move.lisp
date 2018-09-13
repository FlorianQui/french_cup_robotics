; Auto-generated. Do not edit!


(cl:in-package robot2-msg)


;//! \htmlinclude Move.msg.html

(cl:defclass <Move> (roslisp-msg-protocol:ros-message)
  ((poseIni
    :reader poseIni
    :initarg :poseIni
    :type robot2-msg:Pose2DOrient
    :initform (cl:make-instance 'robot2-msg:Pose2DOrient))
   (poseFinal
    :reader poseFinal
    :initarg :poseFinal
    :type robot2-msg:Pose2DOrient
    :initform (cl:make-instance 'robot2-msg:Pose2DOrient)))
)

(cl:defclass Move (<Move>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Move>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Move)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot2-msg:<Move> is deprecated: use robot2-msg:Move instead.")))

(cl:ensure-generic-function 'poseIni-val :lambda-list '(m))
(cl:defmethod poseIni-val ((m <Move>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot2-msg:poseIni-val is deprecated.  Use robot2-msg:poseIni instead.")
  (poseIni m))

(cl:ensure-generic-function 'poseFinal-val :lambda-list '(m))
(cl:defmethod poseFinal-val ((m <Move>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot2-msg:poseFinal-val is deprecated.  Use robot2-msg:poseFinal instead.")
  (poseFinal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Move>) ostream)
  "Serializes a message object of type '<Move>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poseIni) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poseFinal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Move>) istream)
  "Deserializes a message object of type '<Move>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poseIni) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poseFinal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Move>)))
  "Returns string type for a message object of type '<Move>"
  "robot2/Move")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Move)))
  "Returns string type for a message object of type 'Move"
  "robot2/Move")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Move>)))
  "Returns md5sum for a message object of type '<Move>"
  "c8aafdf94929f9d2d798dee01099bb24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Move)))
  "Returns md5sum for a message object of type 'Move"
  "c8aafdf94929f9d2d798dee01099bb24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Move>)))
  "Returns full string definition for message of type '<Move>"
  (cl:format cl:nil "Pose2DOrient poseIni~%Pose2DOrient poseFinal~%~%================================================================================~%MSG: robot2/Pose2DOrient~%int32 x~%int32 y~%int32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Move)))
  "Returns full string definition for message of type 'Move"
  (cl:format cl:nil "Pose2DOrient poseIni~%Pose2DOrient poseFinal~%~%================================================================================~%MSG: robot2/Pose2DOrient~%int32 x~%int32 y~%int32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Move>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poseIni))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poseFinal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Move>))
  "Converts a ROS message object to a list"
  (cl:list 'Move
    (cl:cons ':poseIni (poseIni msg))
    (cl:cons ':poseFinal (poseFinal msg))
))
