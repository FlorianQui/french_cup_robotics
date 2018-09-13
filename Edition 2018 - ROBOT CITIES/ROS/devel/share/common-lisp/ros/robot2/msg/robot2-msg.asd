
(cl:in-package :asdf)

(defsystem "robot2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Move" :depends-on ("_package_Move"))
    (:file "_package_Move" :depends-on ("_package"))
    (:file "Move" :depends-on ("_package_Move"))
    (:file "_package_Move" :depends-on ("_package"))
    (:file "Pose2DOrient" :depends-on ("_package_Pose2DOrient"))
    (:file "_package_Pose2DOrient" :depends-on ("_package"))
    (:file "Pose2DOrient" :depends-on ("_package_Pose2DOrient"))
    (:file "_package_Pose2DOrient" :depends-on ("_package"))
    (:file "Reperage" :depends-on ("_package_Reperage"))
    (:file "_package_Reperage" :depends-on ("_package"))
    (:file "Reperage" :depends-on ("_package_Reperage"))
    (:file "_package_Reperage" :depends-on ("_package"))
  ))