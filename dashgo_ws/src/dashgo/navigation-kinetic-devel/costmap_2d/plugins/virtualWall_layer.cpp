#include<costmap_2d/virtualWall_layer.h>
#include <costmap_2d/costmap_math.h>
#include <pluginlib/class_list_macros.h>
#include <unistd.h>

PLUGINLIB_EXPORT_CLASS(costmap_2d::VirtualWallLayer, costmap_2d::Layer)

using costmap_2d::LETHAL_OBSTACLE;

using costmap_2d::FREE_SPACE;

namespace costmap_2d
{

VirtualWallLayer::VirtualWallLayer() {}

void VirtualWallLayer::onInitialize()
{
  ros::NodeHandle nh("~/" + name_),g_nh,map_nh,delete_nh;
  current_ = true;
  pc_recived = false;

  global_frame_ = layered_costmap_->getGlobalFrameID();

  dsrv_ = new dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>(nh);
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>::CallbackType cb = boost::bind(
      &VirtualWallLayer::reconfigureCB, this, _1, _2);
  dsrv_->setCallback(cb);
  //ROS_WARN("0000000000000000000000");
  std::string virtualWall_topic;
  nh.param("topic", virtualWall_topic, std::string("/virtualWall_cloudPoint"));

  std::string map_topic;
  nh.param("map_topic", map_topic, std::string("map"));
  map_sub_ = map_nh.subscribe(map_topic, 1, &VirtualWallLayer::incomingMap, this);

  virtualWall_sub_=g_nh.subscribe(virtualWall_topic, 1, &VirtualWallLayer::subCallback, this);

  deleteVirtualWall_sub=delete_nh.subscribe("/deleteVirtualWall_cloudPoint", 1, &VirtualWallLayer::deleteWallCallback, this);
  begin = ros::Time::now();
}


void VirtualWallLayer::reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level)
{
  enabled_ = config.enabled;
  //ROS_WARN("111111111111111111111+ enabled_= %d",enabled_);
}

void VirtualWallLayer::matchSize()
{

}

void VirtualWallLayer::updateBounds(double origin_x, double origin_y, double origin_yaw, double* min_x,
                                           double* min_y, double* max_x, double* max_y)
{
  double min_px,min_py,max_px,max_py;
  int pcloud_len=virtualWall_pcloud.points.size();
  //ROS_WARN("22222222"); 
  //ROS_WARN("pcloud_len=%d",pcloud_len);
  useExtraBounds(min_x, min_y, max_x, max_y);
      min_px=-10000.0;
      min_py=-10000.0;
      max_px=10000.0;
      max_py=10000.0;
      *min_x = std::min(*min_x, min_px);
      *min_y = std::min(*min_y, min_py);
      *max_x = std::max(*max_x, max_px);
      *max_y = std::max(*max_y, max_py);
     
      //ROS_WARN("**** min_x=%f, min_y=%f ,max_x= %f, max_y=%f ",*min_x,*min_y,*max_x,*max_y);
}

void VirtualWallLayer::updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i,
                                          int max_j)
{
    //ROS_WARN("====the point num of pcloud is %d ",virtualWall_pcloud.points.size());

    if(virtualWall_pcloud.points.size() < 1)
	return;
    int i,j;
    unsigned int mx, mx_;  
    unsigned int my, my_;
    double wx, wy;
 // Might even be in a different frame
    tf::StampedTransform transform;
    try
    {
      //ROS_WARN("++++ %s",virtualWall_pcloud.header.frame_id.c_str());
      //ROS_WARN("global ++++ %s",global_frame_.c_str());
      tf_->lookupTransform( global_frame_,virtualWall_pcloud.header.frame_id, ros::Time(0), transform);
    }
    catch (tf::TransformException ex)
    {
      ROS_ERROR("%s", ex.what());
      return;
    }

    std::lock_guard<std::mutex> lck(virtual_mutex);
        
    for (i=0;i < virtualWall_pcloud.points.size();i++)
    {
        // Transform from global_frame_ to map_frame_
        tf::Point p(virtualWall_pcloud.points[i].x, virtualWall_pcloud.points[i].y, 0);
        //ROS_WARN("ori (%f, %f)",virtualWall_pcloud.points[i].x, virtualWall_pcloud.points[i].y);
        p = transform(p);
        //ROS_WARN("transform (%f, %f)",p.x(), p.y());

       if(master_grid.worldToMap(p.x(), p.y(), mx, my))
       { 
           master_grid.setCost(mx, my, LETHAL_OBSTACLE);
       }
    }
}

void VirtualWallLayer::subCallback(const sensor_msgs::PointCloud &pcloud)
{
    //ROS_WARN("555555555555555555");
    virtualWall_pcloud= pcloud;
    pc_recived = true;
}

void VirtualWallLayer::deleteWallCallback(const sensor_msgs::PointCloud &deletePcloud)
{

}

void VirtualWallLayer::incomingMap(const nav_msgs::OccupancyGridConstPtr& new_map)
{
  unsigned int size_x = new_map->info.width, size_y = new_map->info.height;
}


} // end namespace
