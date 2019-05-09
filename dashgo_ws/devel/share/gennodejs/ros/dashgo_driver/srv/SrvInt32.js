// Auto-generated. Do not edit!

// (in-package dashgo_driver.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SrvInt32Request {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.arg1 = null;
    }
    else {
      if (initObj.hasOwnProperty('arg1')) {
        this.arg1 = initObj.arg1
      }
      else {
        this.arg1 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SrvInt32Request
    // Serialize message field [arg1]
    bufferOffset = _serializer.int32(obj.arg1, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SrvInt32Request
    let len;
    let data = new SrvInt32Request(null);
    // Deserialize message field [arg1]
    data.arg1 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dashgo_driver/SrvInt32Request';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '064bdc12865ab344c8a048bd743c66ff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 arg1
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SrvInt32Request(null);
    if (msg.arg1 !== undefined) {
      resolved.arg1 = msg.arg1;
    }
    else {
      resolved.arg1 = 0
    }

    return resolved;
    }
};

class SrvInt32Response {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.val = null;
    }
    else {
      if (initObj.hasOwnProperty('val')) {
        this.val = initObj.val
      }
      else {
        this.val = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SrvInt32Response
    // Serialize message field [val]
    bufferOffset = _serializer.int32(obj.val, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SrvInt32Response
    let len;
    let data = new SrvInt32Response(null);
    // Deserialize message field [val]
    data.val = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dashgo_driver/SrvInt32Response';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50ce5d329885e7178604b54270ec733c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 val
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SrvInt32Response(null);
    if (msg.val !== undefined) {
      resolved.val = msg.val;
    }
    else {
      resolved.val = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: SrvInt32Request,
  Response: SrvInt32Response,
  md5sum() { return '6cd15d79626e4186c53fc1d4dab3625b'; },
  datatype() { return 'dashgo_driver/SrvInt32'; }
};
