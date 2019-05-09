#!/usr/bin/env python  
#coding=utf-8  
import rospy
from actionlib_msgs.msg import GoalStatus, GoalID
from geometry_msgs.msg import Quaternion, Pose
from move_base_msgs.msg import MoveBaseActionGoal,MoveBaseActionResult
from std_msgs.msg import Int16
import yaml, os
import redis, json_file
import message_converter

class MultiGoalListen():
    def __init__(self):
        rospy.init_node('MultiGoalListen', anonymous=False)
        rospy.on_shutdown(self.shutdown)
        
        self.r = redis.Redis(host="127.0.0.1", port=6379, db=0)
        if os.path.exists("/home/eaibot/dashgo_ws/src/dashgo/dashgo_nav/maps/current_pose.json")==False:
            open("/home/eaibot/dashgo_ws/src/dashgo/dashgo_nav/maps/current_pose.json","w")
        rospy.Subscriber('/robot_pose', Pose, self.robot_pose_callback)
        self.r.set("RosServiceState", 1) 
        
        self.goal_pub = rospy.Publisher('/move_base/goal', MoveBaseActionGoal, queue_size=5)
        self.goal_cancel = rospy.Publisher('/move_base/cancel', GoalID, queue_size=5)
        rospy.Subscriber('/move_base/result', MoveBaseActionResult, self.status_callback)
        rospy.Subscriber('/multi_cancel_goal', Int16, self.cancel_callback)
        rospy.Subscriber('/multi_publish_goal', Int16, self.publish_callback)

        attr_dict = {  
            "mode": "loop",
            "loopWay": "auto",
            "isNavNext": 0,
            "currentState": "stopped",
            "goalQueue": "GoalQueueA",
            "currentGoal": "",
            "successNum": "0",  
            "failedNum": "0",
            "intervalTime": "3",
        }
        self.r.hmset("GoalState", attr_dict)
        
        self.goal = MoveBaseActionGoal()
        self.isContinue=False
        self.isNavStop=False
        self.lastGoalName=""
        self.failRun=True
        rospy.spin()
        
    def publish_goal(self, mygoalVal):
        quaternion = Quaternion()
        po = yaml.safe_load(mygoalVal)
        self.goal.header.frame_id="map"
        self.goal.header.stamp=rospy.Time.now()
        self.goal.goal_id.stamp=rospy.Time.now()
        self.goal.goal_id.id=str(rospy.Time.now().to_sec())
        self.goal.goal.target_pose.header.frame_id = 'map'
        self.goal.goal.target_pose.header.stamp = rospy.Time.now()
        quaternion.x = float(po.get("orientation").get("x"))
        quaternion.y = float(po.get("orientation").get("y"))
        quaternion.z = float(po.get("orientation").get("z"))
        quaternion.w = float(po.get("orientation").get("w"))
        self.goal.goal.target_pose.pose.position.x = float(po.get("position").get("x"))
        self.goal.goal.target_pose.pose.position.y = float(po.get("position").get("y"))
        self.goal.goal.target_pose.pose.position.z = float(po.get("position").get("z"))
        self.goal.goal.target_pose.pose.orientation = quaternion
        self.goal_pub.publish(self.goal)


    def robot_pose_callback(self, msg):
        attr_dict = message_converter.convert_ros_message_to_dictionary(msg)
        json_file.json_write("/home/eaibot/dashgo_ws/src/dashgo/dashgo_nav/maps/current_pose.json", attr_dict)
        
    def status_callback(self, msg):
        state = msg.status.status
        if state == GoalStatus.SUCCEEDED:
            rospy.loginfo("Goal succeeded!")
            self.r.hincrby("GoalState", "successNum")
        elif state == GoalStatus.PREEMPTED:
            rospy.logwarn("Goal cancel, state code :"+ str(state))
        else :
            rospy.logerr("Goal failed, state code :"+ str(state))
            self.r.hincrby("GoalState", "failedNum")
            if self.failRun==False:
                return
            
        if self.isNavStop==False and state != GoalStatus.PREEMPTED:
            mycurrentState = self.r.hget("GoalState", "currentState")
            mymode = self.r.hget("GoalState", "mode")
            loopWay = self.r.hget("GoalState", "loopWay")
            if mycurrentState == "running" and loopWay == "auto":
                stayTime=(int)(self.r.hget("GoalState" , "intervalTime"))
                if stayTime!=0:    
                    rospy.sleep(stayTime)
                    
                goalQueue = self.r.hget("GoalState", "goalQueue")
                mygoal = self.r.lpop(goalQueue)
                if mygoal != None:
                    if mymode == "loop" and self.r.llen("GoalQueueA")>0:
                        self.r.rpush(goalQueue, mygoal)
                    mygoalVal = self.r.hget("GoalAliaseSet", mygoal)
                    if mygoalVal != None and mygoalVal!="":
                        self.r.hset("GoalState", "currentGoal", mygoal)
                        self.publish_goal(mygoalVal)
                        self.lastGoalName=mygoal
                else:
                    rospy.loginfo("all Goales have been finished")
                    self.r.hset("GoalState", "currentState", "stopped")
                    
            else:
                if self.isContinue==True and loopWay == "auto":
                    self.isContinue=False
                    stayTime=(int)(self.r.hget("GoalState" , "intervalTime"))
                    if stayTime!=0:    
                        rospy.sleep(stayTime)
                        
                    goalQueue = self.r.hget("GoalState", "goalQueue")
                    mygoal = self.r.lpop(goalQueue)
                    if mygoal != None:
                        if mymode == "loop" and self.r.llen("GoalQueueA")>0:
                            self.r.rpush(goalQueue, mygoal)
                        mygoalVal = self.r.hget("GoalAliaseSet", mygoal)
                        if mygoalVal != None and mygoalVal!="":
                            self.r.hset("GoalState", "currentGoal", mygoal)
                            self.publish_goal(mygoalVal)
                            self.lastGoalName=mygoal
                    else:
                        rospy.loginfo("all Goales have been finished")
                        self.r.hset("GoalState", "currentState", "stopped")
                else:
                    self.r.hset("GoalState", "currentState", "stopped")
                
        
    def publish_callback(self, msg):
        mymode = self.r.hget("GoalState", "mode")

        if msg.data==2:
            self.failRun=False
        elif msg.data==0:
            self.failRun=True
            
        if msg.data==1 and self.lastGoalName!="":
            self.r.lpush("GoalQueueA", self.lastGoalName)
            if mymode == "loop":
                self.r.rpop("GoalQueueA")
                
        mygoal = self.r.lpop("GoalQueueA")
        if mygoal != None:
            if mymode == "loop":
                self.r.rpush("GoalQueueA", mygoal)
            mygoalVal = self.r.hget("GoalAliaseSet", mygoal)
            if mygoalVal != None and mygoalVal!="":
                self.r.hset("GoalState", "currentGoal", mygoal)
                self.publish_goal(mygoalVal)
                self.r.hset("GoalState", "currentState", "running")
                self.lastGoalName=mygoal
                self.isNavStop=False
        else:
            rospy.loginfo("no goals can be used ")
            self.r.hset("GoalState", "currentState", "stopped")
    
    def cancel_callback(self, msg):
        state = self.r.hget("GoalState", "currentState")
        if state == "running":
            if self.goal_cancel!=None and self.goal!=None :
                self.goal_cancel.publish(self.goal.goal_id)
            self.r.hset("GoalState", "currentState", "stopped")
            
        if msg.data==1 or msg.data==2 :
            if msg.data==2:
                self.isContinue=True
            if msg.data==1:
                self.isNavStop=True
            mygoal = self.r.hget("GoalState", "currentGoal")
            if mygoal!=None and mygoal!="" :
                mygoalVal = self.r.hget("GoalAliaseSet", mygoal)
                self.publish_goal(mygoalVal)
                self.r.hset("GoalState", "currentState", "running")
                self.lastGoalName=mygoal
            else:
                rospy.loginfo("the goal is not existed")
                self.r.hset("GoalState", "currentState", "stopped")
        elif msg.data==3:
            self.isNavStop=True

    def shutdown(self):
        rospy.loginfo("Stopping the multi goals ...")
        if self.goal_cancel!=None and self.goal!=None :
            self.goal_cancel.publish(self.goal.goal_id)
        self.r.hset("GoalState", "currentState", "stopped")
        rospy.sleep(1)

