#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/eaibot/dashgo_ws/src/dashgo/navigation-kinetic-devel/base_local_planner"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/eaibot/dashgo_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/eaibot/dashgo_ws/install/lib/python2.7/dist-packages:/home/eaibot/dashgo_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/eaibot/dashgo_ws/build" \
    "/usr/bin/python" \
    "/home/eaibot/dashgo_ws/src/dashgo/navigation-kinetic-devel/base_local_planner/setup.py" \
    build --build-base "/home/eaibot/dashgo_ws/build/dashgo/navigation-kinetic-devel/base_local_planner" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/eaibot/dashgo_ws/install" --install-scripts="/home/eaibot/dashgo_ws/install/bin"
