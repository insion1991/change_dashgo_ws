
#ifndef SIMPLE_LAYER_H_
#define SIMPLE_LAYER_H_
#include <ros/ros.h>
#include <costmap_2d/layer.h>
#include <costmap_2d/costmap_layer.h>
#include <costmap_2d/layered_costmap.h>
#include <costmap_2d/GenericPluginConfig.h>
#include <dynamic_reconfigure/server.h>
#include <nav_msgs/OccupancyGrid.h>
#include <map_msgs/OccupancyGridUpdate.h>
#include <sensor_msgs/PointCloud.h>
#include <message_filters/subscriber.h>
#include <mutex>


namespace costmap_2d
{

class VirtualWallLayer : public CostmapLayer               //public costmap_2d::Layer
{
public:
  VirtualWallLayer();

  virtual void onInitialize();
  virtual void updateBounds(double origin_x, double origin_y, double origin_yaw, double* min_x, double* min_y, double* max_x,
                             double* max_y);
  virtual void updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i, int max_j);
  virtual void matchSize();

  void subCallback(const sensor_msgs::PointCloud &pcloud);
  void deleteWallCallback(const sensor_msgs::PointCloud &pcloud);

private:
  void reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level);

  double mark_x_, mark_y_;
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig> *dsrv_;
  ros::Subscriber virtualWall_sub_,map_sub_,deleteVirtualWall_sub;
  sensor_msgs::PointCloud virtualWall_pcloud,deleteVirtualWall_pcloud,wallStatus_pcloud;
  ros::Publisher pub_;
  void incomingMap(const nav_msgs::OccupancyGridConstPtr& new_map);
  ros::Time begin,then;
  std::mutex virtual_mutex;
  std::string global_frame_; 
  bool pc_recived;
};
}
#endif
