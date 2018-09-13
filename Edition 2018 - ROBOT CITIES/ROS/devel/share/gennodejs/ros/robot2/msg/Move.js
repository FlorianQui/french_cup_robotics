// Auto-generated. Do not edit!

// (in-package robot2.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Pose2DOrient = require('./Pose2DOrient.js');

//-----------------------------------------------------------

class Move {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.poseIni = null;
      this.poseFinal = null;
    }
    else {
      if (initObj.hasOwnProperty('poseIni')) {
        this.poseIni = initObj.poseIni
      }
      else {
        this.poseIni = new Pose2DOrient();
      }
      if (initObj.hasOwnProperty('poseFinal')) {
        this.poseFinal = initObj.poseFinal
      }
      else {
        this.poseFinal = new Pose2DOrient();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Move
    // Serialize message field [poseIni]
    bufferOffset = Pose2DOrient.serialize(obj.poseIni, buffer, bufferOffset);
    // Serialize message field [poseFinal]
    bufferOffset = Pose2DOrient.serialize(obj.poseFinal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Move
    let len;
    let data = new Move(null);
    // Deserialize message field [poseIni]
    data.poseIni = Pose2DOrient.deserialize(buffer, bufferOffset);
    // Deserialize message field [poseFinal]
    data.poseFinal = Pose2DOrient.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot2/Move';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8aafdf94929f9d2d798dee01099bb24';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Pose2DOrient poseIni
    Pose2DOrient poseFinal
    
    ================================================================================
    MSG: robot2/Pose2DOrient
    int32 x
    int32 y
    int32 theta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Move(null);
    if (msg.poseIni !== undefined) {
      resolved.poseIni = Pose2DOrient.Resolve(msg.poseIni)
    }
    else {
      resolved.poseIni = new Pose2DOrient()
    }

    if (msg.poseFinal !== undefined) {
      resolved.poseFinal = Pose2DOrient.Resolve(msg.poseFinal)
    }
    else {
      resolved.poseFinal = new Pose2DOrient()
    }

    return resolved;
    }
};

module.exports = Move;
