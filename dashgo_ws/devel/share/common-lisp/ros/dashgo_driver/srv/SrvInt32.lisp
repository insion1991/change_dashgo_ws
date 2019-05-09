; Auto-generated. Do not edit!


(cl:in-package dashgo_driver-srv)


;//! \htmlinclude SrvInt32-request.msg.html

(cl:defclass <SrvInt32-request> (roslisp-msg-protocol:ros-message)
  ((arg1
    :reader arg1
    :initarg :arg1
    :type cl:integer
    :initform 0))
)

(cl:defclass SrvInt32-request (<SrvInt32-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SrvInt32-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SrvInt32-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dashgo_driver-srv:<SrvInt32-request> is deprecated: use dashgo_driver-srv:SrvInt32-request instead.")))

(cl:ensure-generic-function 'arg1-val :lambda-list '(m))
(cl:defmethod arg1-val ((m <SrvInt32-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dashgo_driver-srv:arg1-val is deprecated.  Use dashgo_driver-srv:arg1 instead.")
  (arg1 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SrvInt32-request>) ostream)
  "Serializes a message object of type '<SrvInt32-request>"
  (cl:let* ((signed (cl:slot-value msg 'arg1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SrvInt32-request>) istream)
  "Deserializes a message object of type '<SrvInt32-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'arg1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SrvInt32-request>)))
  "Returns string type for a service object of type '<SrvInt32-request>"
  "dashgo_driver/SrvInt32Request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SrvInt32-request)))
  "Returns string type for a service object of type 'SrvInt32-request"
  "dashgo_driver/SrvInt32Request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SrvInt32-request>)))
  "Returns md5sum for a message object of type '<SrvInt32-request>"
  "6cd15d79626e4186c53fc1d4dab3625b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SrvInt32-request)))
  "Returns md5sum for a message object of type 'SrvInt32-request"
  "6cd15d79626e4186c53fc1d4dab3625b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SrvInt32-request>)))
  "Returns full string definition for message of type '<SrvInt32-request>"
  (cl:format cl:nil "int32 arg1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SrvInt32-request)))
  "Returns full string definition for message of type 'SrvInt32-request"
  (cl:format cl:nil "int32 arg1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SrvInt32-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SrvInt32-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SrvInt32-request
    (cl:cons ':arg1 (arg1 msg))
))
;//! \htmlinclude SrvInt32-response.msg.html

(cl:defclass <SrvInt32-response> (roslisp-msg-protocol:ros-message)
  ((val
    :reader val
    :initarg :val
    :type cl:integer
    :initform 0))
)

(cl:defclass SrvInt32-response (<SrvInt32-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SrvInt32-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SrvInt32-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dashgo_driver-srv:<SrvInt32-response> is deprecated: use dashgo_driver-srv:SrvInt32-response instead.")))

(cl:ensure-generic-function 'val-val :lambda-list '(m))
(cl:defmethod val-val ((m <SrvInt32-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dashgo_driver-srv:val-val is deprecated.  Use dashgo_driver-srv:val instead.")
  (val m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SrvInt32-response>) ostream)
  "Serializes a message object of type '<SrvInt32-response>"
  (cl:let* ((signed (cl:slot-value msg 'val)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SrvInt32-response>) istream)
  "Deserializes a message object of type '<SrvInt32-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'val) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SrvInt32-response>)))
  "Returns string type for a service object of type '<SrvInt32-response>"
  "dashgo_driver/SrvInt32Response")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SrvInt32-response)))
  "Returns string type for a service object of type 'SrvInt32-response"
  "dashgo_driver/SrvInt32Response")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SrvInt32-response>)))
  "Returns md5sum for a message object of type '<SrvInt32-response>"
  "6cd15d79626e4186c53fc1d4dab3625b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SrvInt32-response)))
  "Returns md5sum for a message object of type 'SrvInt32-response"
  "6cd15d79626e4186c53fc1d4dab3625b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SrvInt32-response>)))
  "Returns full string definition for message of type '<SrvInt32-response>"
  (cl:format cl:nil "int32 val~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SrvInt32-response)))
  "Returns full string definition for message of type 'SrvInt32-response"
  (cl:format cl:nil "int32 val~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SrvInt32-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SrvInt32-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SrvInt32-response
    (cl:cons ':val (val msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SrvInt32)))
  'SrvInt32-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SrvInt32)))
  'SrvInt32-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SrvInt32)))
  "Returns string type for a service object of type '<SrvInt32>"
  "dashgo_driver/SrvInt32")