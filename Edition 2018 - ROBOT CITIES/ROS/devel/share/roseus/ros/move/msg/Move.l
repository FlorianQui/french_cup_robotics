;; Auto-generated. Do not edit!


(when (boundp 'move::Move)
  (if (not (find-package "MOVE"))
    (make-package "MOVE"))
  (shadow 'Move (find-package "MOVE")))
(unless (find-package "MOVE::MOVE")
  (make-package "MOVE::MOVE"))

(in-package "ROS")
;;//! \htmlinclude Move.msg.html


(defclass move::Move
  :super ros::object
  :slots (_request _x _y _theta ))

(defmethod move::Move
  (:init
   (&key
    ((:request __request) "")
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    )
   (send-super :init)
   (setq _request (string __request))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   self)
  (:request
   (&optional __request)
   (if __request (setq _request __request)) _request)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; string _request
    4 (length _request)
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _request
       (write-long (length _request) s) (princ _request s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _request
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _request (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get move::Move :md5sum-) "91ab38f7f075dd739239ede7900d320f")
(setf (get move::Move :datatype-) "move/Move")
(setf (get move::Move :definition-)
      "string request
float32 x
float32 y
float32 theta

")



(provide :move/Move "91ab38f7f075dd739239ede7900d320f")


