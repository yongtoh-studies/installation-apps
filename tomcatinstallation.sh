#!/bin/bash
# Use this script to install tomcat in rehat servers
echo delete the failed version of tomcat
sudo rm -rf /opt/tomcat10
echo assign a hostname to your server 
sudo hostname tomcat2
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
cd /opt 
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it.
sudo yum install wget unzip -y

sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.22/bin/apache-tomcat-10.0.22.tar.gz
sudo tar -xvf apache-tomcat-10.0.22.tar.gz
sudo rm apache-tomcat-10.0.22.tar.gz
sudo mv apache-tomcat-10.0.22 tomcat10
sudo chmod 777 -R /opt/tomcat10
sudo chown ec2-user -R /opt/tomcat10
sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo yum update -y
starttomcat
# To be able to access Tomcat from another computer, we have to access a file in Tomcat and comment on a line(Tomcat server Configuration). 
# vi /opt/tomcat10/webapps/manager/META-INF/context.xml
# <!--
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
-->
# To be able to access tomcat from the gui, you have to create a user in the configurations file as follows
vi /opt/tomcat9/conf/tomcat-users.xml
# to add user
<user username="admin" password="admin123" roles="manager-gui,admin-gui, manager-script"/>
  <user username="simon" password="admin123" roles="admin-gui"/> 
  -->


