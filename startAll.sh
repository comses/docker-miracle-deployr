#!/bin/sh
COMSES_USER=${USERNAME:-comses}
INSTALL_FOLDER=/home/$COMSES_USER/deployr/8.0.0
$INSTALL_FOLDER/mongo/mongod.sh start
$INSTALL_FOLDER/rserve/rserve.sh start
python /opt/deployr/adduser.py
#yes | $INSTALL_FOLDER/deployr/tools/setWebContext.sh -ip 192.168.99.100 -disableauto
$INSTALL_FOLDER/tomcat/tomcat7/bin/catalina.sh run > $INSTALL_FOLDER/tomcat/tomcat7/logs/tomcat.log 2>&1
