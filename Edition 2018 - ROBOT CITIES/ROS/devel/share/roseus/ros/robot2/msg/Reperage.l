;; Auto-generated. Do not edit!


(when (boundp 'robot2::Reperage)
  (if (not (find-package "ROBOT2"))
    (make-package "ROBOT2"))
  (shadow 'Reperage (find-package "ROBOT2")))
(unless (find-package "ROBOT2::REPERAGE")
  (make-package "ROBOT2::REPERAGE"))

(in-package "ROS")
;;//! \htmlinclude Reperage.msg.html


(defclass robot2::Reperage
  :super ros::object
  :slots (_alpha _omega _gamma ))

(defmethod robot2::Reperage
  (:init
   (&key
    ((:alpha __alpha) 0.0)
    ((:omega __omega) 0.0)
    ((:gamma __gamma) 0.0)
    )
   (send-super :init)
   (setq _alpha (float __alpha))
   (setq _omega (float __omega))
   (setq _gamma (float __gamma))
   self)
  (:alpha
   (&optional __alpha)
   (if __alpha (setq _alpha __alpha)) _alpha)
  (:omega
   (&optional __omega)
   (if __omega (setq _omega __omega)) _omega)
  (:gamma
   (&optional __gamma)
   (if __gamma (setq _gamma __gamma)) _gamma)
  (:serialization-length
   ()
   (+
    ;; float32 _alpha
    4
    ;; float32 _omega
    4
    ;; float32 _gamma
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _alpha
       (sys::poke _alpha (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _omega
       (sys::poke _omega (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gamma
       (sys::poke _gamma (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _alpha
     (setq _alpha (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _omega
     (setq _omega (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gamma
     (setq _gamma (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot2::Reperage :md5sum-) "edee403981ddd7ed65182c1f936a872a")
(setf (get robot2::Reperage :datatype-) "robot2/Reperage")
(setf (get robot2::Reperage :definition-)
      "float32 alpha
float32 omega
float32 gamma

")



(provide :robot2/Reperage "edee403981ddd7ed65182c1f936a872a")


