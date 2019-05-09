; Auto-generated. Do not edit!


(cl:in-package dashgo_tools-msg)


;//! \htmlinclude check_msgGoal.msg.html

(cl:defclass <check_msgGoal> (roslisp-msg-protocol:ros-message)
  ((method
    :reader method
    :initarg :method
    :type cl:string
    :initform "")
   (imu
    :reader imu
    :initarg :imu
    :type cl:string
    :initform "")
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (angule
    :reader angule
    :initarg :angule
    :type cl:float
    :initform 0.0)
   (vel
    :reader vel
    :initarg :vel
    :type cl:float
    :initform 0.0)
   (error
    :reader error
    :initarg :error
    :type cl:float
    :initform 0.0))
)

(cl:defclass check_msgGoal (<check_msgGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <check_msgGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'check_msgGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dashgo_tools-msg:<check_msgGoal> is deprecated: use dashgo_tools-msg:check_msgGoal instead.")))

(cl:ensure-generic-function 'method-val :lambda-list '(m))
(cl:defmethod method-val ((m <check_msgGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dashgo_tools-msg:method-val is deprecated.  Use dashgo_tools-msg:method instead.")
  (method m))

(cl:ensure-generic-function 'imu-val :lambda-list '(m))
(cl:defmethod imu-val ((m <check_msgGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dashgo_tools-msg:imu-val is deprecated.  Use dashgo_tools-msg:imu instead.")
  (imu m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <check_msgGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dashgo_tools-msg:distance-val is deprecated.  Use dashgo_tools-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'angule-val :lambda-list '(m))
(cl:defmethod angule-val ((m <check_msgGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dashgo_tools-msg:angule-val is deprecated.  Use dashgo_tools-msg:angule instead.")
  (angule m))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <check_msgGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dashgo_tools-msg:vel-val is deprecated.  Use dashgo_tools-msg:vel instead.")
  (vel m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <check_msgGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dashgo_tools-msg:error-val is deprecated.  Use dashgo_tools-msg:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <check_msgGoal>) ostream)
  "Serializes a message object of type '<check_msgGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'method))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'method))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'imu))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'imu))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angule))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <check_msgGoal>) istream)
  "Deserializes a message object of type '<check_msgGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'method) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'method) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'imu) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'imu) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angule) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'error) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<check_msgGoal>)))
  "Returns string type for a message object of type '<check_msgGoal>"
  "dashgo_tools/check_msgGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'check_msgGoal)))
  "Returns string type for a message object of type 'check_msgGoal"
  "dashgo_tools/check_msgGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<check_msgGoal>)))
  "Returns md5sum for a message object of type '<check_msgGoal>"
  "80846c2aaf95c842d4343d524003feda")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'check_msgGoal)))
  "Returns md5sum for a message object of type 'check_msgGoal"
  "80846c2aaf95c842d4343d524003feda")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<check_msgGoal>)))
  "Returns full string definition for message of type '<check_msgGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%string method~%string imu~%float32 distance~%float32 angule~%float32 vel~%float32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'check_msgGoal)))
  "Returns full string definition for message of type 'check_msgGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%string method~%string imu~%float32 distance~%float32 angule~%float32 vel~%float32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <check_msgGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'method))
     4 (cl:length (cl:slot-value msg 'imu))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <check_msgGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'check_msgGoal
    (cl:cons ':method (method msg))
    (cl:cons ':imu (imu msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':angule (angule msg))
    (cl:cons ':vel (vel msg))
    (cl:cons ':error (error msg))
))
