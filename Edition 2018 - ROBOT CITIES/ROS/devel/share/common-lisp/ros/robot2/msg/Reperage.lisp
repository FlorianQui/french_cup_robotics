; Auto-generated. Do not edit!


(cl:in-package robot2-msg)


;//! \htmlinclude Reperage.msg.html

(cl:defclass <Reperage> (roslisp-msg-protocol:ros-message)
  ((alpha
    :reader alpha
    :initarg :alpha
    :type cl:float
    :initform 0.0)
   (omega
    :reader omega
    :initarg :omega
    :type cl:float
    :initform 0.0)
   (gamma
    :reader gamma
    :initarg :gamma
    :type cl:float
    :initform 0.0))
)

(cl:defclass Reperage (<Reperage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Reperage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Reperage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot2-msg:<Reperage> is deprecated: use robot2-msg:Reperage instead.")))

(cl:ensure-generic-function 'alpha-val :lambda-list '(m))
(cl:defmethod alpha-val ((m <Reperage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot2-msg:alpha-val is deprecated.  Use robot2-msg:alpha instead.")
  (alpha m))

(cl:ensure-generic-function 'omega-val :lambda-list '(m))
(cl:defmethod omega-val ((m <Reperage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot2-msg:omega-val is deprecated.  Use robot2-msg:omega instead.")
  (omega m))

(cl:ensure-generic-function 'gamma-val :lambda-list '(m))
(cl:defmethod gamma-val ((m <Reperage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot2-msg:gamma-val is deprecated.  Use robot2-msg:gamma instead.")
  (gamma m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Reperage>) ostream)
  "Serializes a message object of type '<Reperage>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'alpha))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'omega))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gamma))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Reperage>) istream)
  "Deserializes a message object of type '<Reperage>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'alpha) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'omega) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gamma) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Reperage>)))
  "Returns string type for a message object of type '<Reperage>"
  "robot2/Reperage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reperage)))
  "Returns string type for a message object of type 'Reperage"
  "robot2/Reperage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Reperage>)))
  "Returns md5sum for a message object of type '<Reperage>"
  "edee403981ddd7ed65182c1f936a872a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Reperage)))
  "Returns md5sum for a message object of type 'Reperage"
  "edee403981ddd7ed65182c1f936a872a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Reperage>)))
  "Returns full string definition for message of type '<Reperage>"
  (cl:format cl:nil "float32 alpha~%float32 omega~%float32 gamma~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Reperage)))
  "Returns full string definition for message of type 'Reperage"
  (cl:format cl:nil "float32 alpha~%float32 omega~%float32 gamma~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Reperage>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Reperage>))
  "Converts a ROS message object to a list"
  (cl:list 'Reperage
    (cl:cons ':alpha (alpha msg))
    (cl:cons ':omega (omega msg))
    (cl:cons ':gamma (gamma msg))
))
