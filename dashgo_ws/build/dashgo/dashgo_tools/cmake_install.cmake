# Install script for directory: /home/eaibot/dashgo_ws/src/dashgo/dashgo_tools

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/eaibot/dashgo_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dashgo_tools/action" TYPE FILE FILES "/home/eaibot/dashgo_ws/src/dashgo/dashgo_tools/action/check_msg.action")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dashgo_tools/msg" TYPE FILE FILES
    "/home/eaibot/dashgo_ws/devel/share/dashgo_tools/msg/check_msgAction.msg"
    "/home/eaibot/dashgo_ws/devel/share/dashgo_tools/msg/check_msgActionGoal.msg"
    "/home/eaibot/dashgo_ws/devel/share/dashgo_tools/msg/check_msgActionResult.msg"
    "/home/eaibot/dashgo_ws/devel/share/dashgo_tools/msg/check_msgActionFeedback.msg"
    "/home/eaibot/dashgo_ws/devel/share/dashgo_tools/msg/check_msgGoal.msg"
    "/home/eaibot/dashgo_ws/devel/share/dashgo_tools/msg/check_msgResult.msg"
    "/home/eaibot/dashgo_ws/devel/share/dashgo_tools/msg/check_msgFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dashgo_tools/cmake" TYPE FILE FILES "/home/eaibot/dashgo_ws/build/dashgo/dashgo_tools/catkin_generated/installspace/dashgo_tools-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/eaibot/dashgo_ws/devel/include/dashgo_tools")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/eaibot/dashgo_ws/devel/share/roseus/ros/dashgo_tools")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/eaibot/dashgo_ws/devel/share/common-lisp/ros/dashgo_tools")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/eaibot/dashgo_ws/devel/share/gennodejs/ros/dashgo_tools")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/eaibot/dashgo_ws/devel/lib/python2.7/dist-packages/dashgo_tools")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/eaibot/dashgo_ws/devel/lib/python2.7/dist-packages/dashgo_tools")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/eaibot/dashgo_ws/build/dashgo/dashgo_tools/catkin_generated/installspace/dashgo_tools.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dashgo_tools/cmake" TYPE FILE FILES "/home/eaibot/dashgo_ws/build/dashgo/dashgo_tools/catkin_generated/installspace/dashgo_tools-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dashgo_tools/cmake" TYPE FILE FILES
    "/home/eaibot/dashgo_ws/build/dashgo/dashgo_tools/catkin_generated/installspace/dashgo_toolsConfig.cmake"
    "/home/eaibot/dashgo_ws/build/dashgo/dashgo_tools/catkin_generated/installspace/dashgo_toolsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dashgo_tools" TYPE FILE FILES "/home/eaibot/dashgo_ws/src/dashgo/dashgo_tools/package.xml")
endif()

