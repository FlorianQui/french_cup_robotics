; Auto-generated. Do not edit!


(cl:in-package robot2-msg)


;//! \htmlinclude Pose2DOrient.msg.html

(cl:defclass <Pose2DOrient> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:integer
    :initform 0))
)

(cl:defclass Pose2DOrient (<Pose2DOrient>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pose2DOrient>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pose2DOrient)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot2-msg:<Pose2DOrient> is deprecated: use robot2-msg:Pose2DOrient instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Pose2DOrient>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot2-msg:x-val is deprecated.  Use robot2-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Pose2DOrient>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot2-msg:y-val is deprecated.  Use robot2-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <Pose2DOrient>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot2-msg:theta-val is deprecated.  Use robot2-msg:theta instead.")
  (theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pose2DOrient>) ostream)
  "Serializes a message object of type '<Pose2DOrient>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'theta)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pose2DOrient>) istream)
  "Deserializes a message object of type '<Pose2DOrient>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'theta) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pose2DOrient>)))
  "Returns string type for a message object of type '<Pose2DOrient>"
  "robot2/Pose2DOrient")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pose2DOrient)))
  "Returns string type for a message object of type 'Pose2DOrient"
  "robot2/Pose2DOrient")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pose2DOrient>)))
  "Returns md5sum for a message object of type '<Pose2DOrient>"
  "2bff1127cd10ca02349c9c72c72be56e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pose2DOrient)))
  "Returns md5sum for a message object of type 'Pose2DOrient"
  "2bff1127cd10ca02349c9c72c72be56e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pose2DOrient>)))
  "Returns full string definition for message of type '<Pose2DOrient>"
  (cl:format cl:nil "int32 x~%int32 y~%int32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pose2DOrient)))
  "Returns full string definition for message of type 'Pose2DOrient"
  (cl:format cl:nil "int32 x~%int32 y~%int32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pose2DOrient>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pose2DOrient>))
  "Converts a ROS message object to a list"
  (cl:list 'Pose2DOrient
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
))
