
(cl:in-package :asdf)

(defsystem "dashgo_driver-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SrvInt32" :depends-on ("_package_SrvInt32"))
    (:file "_package_SrvInt32" :depends-on ("_package"))
  ))