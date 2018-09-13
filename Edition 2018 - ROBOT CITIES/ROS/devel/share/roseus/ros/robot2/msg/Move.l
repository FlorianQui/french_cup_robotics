;; Auto-generated. Do not edit!


(when (boundp 'robot2::Move)
  (if (not (find-package "ROBOT2"))
    (make-package "ROBOT2"))
  (shadow 'Move (find-package "ROBOT2")))
(unless (find-package "ROBOT2::MOVE")
  (make-package "ROBOT2::MOVE"))

(in-package "ROS")
;;//! \htmlinclude Move.msg.html


(defclass robot2::Move
  :super ros::object
  :slots (_poseIni _poseFinal ))

(defmethod robot2::Move
  (:init
   (&key
    ((:poseIni __poseIni) (instance robot2::Pose2DOrient :init))
    ((:poseFinal __poseFinal) (instance robot2::Pose2DOrient :init))
    )
   (send-super :init)
   (setq _poseIni __poseIni)
   (setq _poseFinal __poseFinal)
   self)
  (:poseIni
   (&rest __poseIni)
   (if (keywordp (car __poseIni))
       (send* _poseIni __poseIni)
     (progn
       (if __poseIni (setq _poseIni (car __poseIni)))
       _poseIni)))
  (:poseFinal
   (&rest __poseFinal)
   (if (keywordp (car __poseFinal))
       (send* _poseFinal __poseFinal)
     (progn
       (if __poseFinal (setq _poseFinal (car __poseFinal)))
       _poseFinal)))
  (:serialization-length
   ()
   (+
    ;; robot2/Pose2DOrient _poseIni
    (send _poseIni :serialization-length)
    ;; robot2/Pose2DOrient _poseFinal
    (send _poseFinal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; robot2/Pose2DOrient _poseIni
       (send _poseIni :serialize s)
     ;; robot2/Pose2DOrient _poseFinal
       (send _poseFinal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; robot2/Pose2DOrient _poseIni
     (send _poseIni :deserialize buf ptr-) (incf ptr- (send _poseIni :serialization-length))
   ;; robot2/Pose2DOrient _poseFinal
     (send _poseFinal :deserialize buf ptr-) (incf ptr- (send _poseFinal :serialization-length))
   ;;
   self)
  )

(setf (get robot2::Move :md5sum-) "c8aafdf94929f9d2d798dee01099bb24")
(setf (get robot2::Move :datatype-) "robot2/Move")
(setf (get robot2::Move :definition-)
      "Pose2DOrient poseIni
Pose2DOrient poseFinal

================================================================================
MSG: robot2/Pose2DOrient
int32 x
int32 y
int32 theta

")



(provide :robot2/Move "c8aafdf94929f9d2d798dee01099bb24")


